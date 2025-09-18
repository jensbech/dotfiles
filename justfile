_default:
    @just --list

stow:
    stow -v -t ~ .

restow:
    stow -v -D -t ~ .
    just stow

brew:
    setup/brew.sh

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
