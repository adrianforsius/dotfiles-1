#!/usr/bin/env bash
cd ~

dotfiles=${DOTFILES:-$1}
if [ -z $dotfiles ]; then
  echo "No dotfiles dir specified"
  exit 0
fi;

function doIt() {
  for file in ~/.{path,bash_prompt,bash_profile,exports,aliases,functions,extra,vimrc,bashrc,inputrc,screenrc,gitconfig,curlrc,wgetrc,tmux.conf,linux,mac}; do
    cp "$file" ${dotfiles}
  done;
  green='\033[1;32m'
  NC='\033[0m'
  echo -e "${green}Files copied successfully!${NC}";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
