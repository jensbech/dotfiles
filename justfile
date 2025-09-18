default:
    @just --list

# Stow dotfiles
stow:
    @echo "Stowing dotfiles to home directory..."
    stow -v -t ~ .

# Install Homebrew packages
brew:
    bash setup/brew.sh

# Pull latest changes and restow
sync:
    @echo "Pulling latest changes..."
    git pull
    @echo "Re-stowing dotfiles..."
    just restow
