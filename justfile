_default:
    @just --list

vscode_path := "$HOME/Library/Application Support/Code/User"

stow:
    stow -v -t ~ . --ignore='vscode' --ignore='justfile' --ignore='global-justfile'
    stow -v -t "{{vscode_path}}" vscode
    just stow-global

unstow:
    stow -v -D -t ~ . --ignore='vscode' --ignore='justfile' --ignore='global-justfile'
    stow -v -D -t "{{vscode_path}}" vscode
    just unstow-global

restow:
    just unstow stow

stow-vscode:
    stow -v -t "{{vscode_path}}" vscode

stow-global:
    ln -sf "{{justfile_directory()}}/global-justfile" ~/justfile

unstow-global:
    rm -f ~/justfile

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
