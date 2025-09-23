_default:
    @just --list

vscode_path := "$HOME/Library/Application Support/Code/User"

stow:
    stow -v -t ~ . --ignore='vscode' --ignore='justfile' --ignore 'setup'
    stow -v -t "{{vscode_path}}" vscode

unstow:
    stow -v -D -t ~ . --ignore='vscode' --ignore='justfile' --ignore 'setup'
    stow -v -D -t "{{vscode_path}}" vscode

restow:
    just unstow stow

stow-vscode:
    stow -v -D -t "{{vscode_path}}" vscode
    stow -v -t "{{vscode_path}}" vscode

brew:
    setup/brew.sh

brupdate:
    brew update && brew upgrade

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
