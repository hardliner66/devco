#!/usr/bin/env bash

script_dir="$(dirname "$(readlink -f "$0")")"

npm install -g @devcontainers/cli

if [ -x "$(command -v apt-get)" ]; then
  sudo apt-get update
  sudo apt-get install jq
fi

if [ -x "$(command -v pacman)" ]; then
  sudo pacman -Sy jq
fi

for f in devco devco-up devco-shell devco-dir devco-make-tool
do
  sudo ln -fs "$script_dir/$f" /usr/local/bin/"$f"
done
