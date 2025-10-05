_default:
    @just --list

stow:
    just stow-global

unstow:
    stow -v -D -t ~ . --ignore='vscode' --ignore='justfile' --ignore='global-justfile'
    just unstow-global

restow:
    just unstow stow

stow-vscode:

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
