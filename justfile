_default:
    @just --list

stow:
    stow -v -t ~ .

restow:
    stow -v -D -t ~ .
    stow -v -t ~ .

brew:
    bash setup/brew.sh

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
