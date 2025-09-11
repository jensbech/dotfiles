# cli
cli_apps=(
  gh
  lazygit
  lazydocker
  stow
  helix
  eza
  yazi
  just
  typescript
)

brew install "${cli_apps[@]}"

# gui
gui_apps=(
  brave-browser
  bitwarden
  protonvpn
  alacritty
  visual-studio-code
  spotify
  raycast
  discord
  nikitabobko/tap/aerospace
  signal
  bettertouchtool
)

brew install --cask "${gui_apps[@]}"

