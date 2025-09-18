_default:
    @just --list

vscode_path := "$HOME/Library/Application Support/Code/User"

install-justfile:
    mkdir -p ~/.config/just
    cp justfile ~/.config/just/justfile
    @echo "Global justfile installed! You can now run 'just' from anywhere."

stow:
    stow -v -t ~ . --ignore='vscode'
    stow -v -t "{{vscode_path}}" vscode

unstow:
    stow -v -D -t ~ . --ignore='vscode'
    stow -v -D -t "{{vscode_path}}" vscode

restow:
    just unstow
    just stow

stow-vscode:
    stow -v -D -t "{{vscode_path}}" vscode
    stow -v -t "{{vscode_path}}" vscode

brew:
    setup/brew.sh

pull:
    git pull
    just stow

push:
    git add .
    git commit -m "update"
    git push
