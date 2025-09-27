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
  bat
  borders
)

brew install "${cli_apps[@]}"

# gui
gui_apps=(
  brave-browser
  bitwarden
  protonvpn
  alacritty
  # visual-studio-code
  vscodium
  spotify
  raycast
  discord
  nikitabobko/tap/aerospace
  signal
  bettertouchtool
  logi-options+
  mos
  pnpm
)
brew tap FelixKratz/formulae
brew install --cask "${gui_apps[@]}"

