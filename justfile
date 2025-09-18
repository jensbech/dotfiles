_default:
    @just --list

stow:
    stow -v -t ~ . --ignore='vscode'
    stow -v -t "$HOME/Library/Application Support/Code/User" vscode

restow:
    stow -v -D -t ~ . --ignore='vscode'
    stow -v -t ~ . --ignore='vscode'
    just stow-vscode

stow-vscode:
    stow -v -D -t "$HOME/Library/Application Support/Code/User" vscode
    stow -v -t "$HOME/Library/Application Support/Code/User" vscode

brew:
    setup/brew.sh

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
