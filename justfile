_default:
    @just --list

vscode_path := "$HOME/Library/Application Support/Code/User"

stow:
    stow -v -t ~ . --ignore='vscode' --ignore='justfile'
    stow -v -t "{{vscode_path}}" vscode

unstow:
    stow -v -D -t ~ . --ignore='vscode' --ignore='justfile'
    stow -v -D -t "{{vscode_path}}" vscode

restow:
    just unstow stow

stow-vscode:
    stow -v -t "{{vscode_path}}" vscode

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
