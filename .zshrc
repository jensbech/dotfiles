# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Path configurations - using macOS style paths
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Pulumi
export PATH=$PATH:$HOME/.pulumi/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"  # bun completions

# helix
alias hh="hx"
export EDITOR=hx

# dotnet
export DOTNET_ROOT=/usr/local/share/dotnet
export PATH="$PATH:$HOME/.dotnet/tools"

# bitwarden path (app store install)
export SSH_AUTH_SOCK=$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

# Git shortcuts
alias check="git checkout"
alias main="git checkout main"
alias stable="git checkout stable"
alias pull="git pull"
alias stash="git stash"
alias pop="git stash pop"
alias root='cd $(git rev-parse --show-toplevel)'

# Other shortcuts
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"
alias dn="dotnet"

# Performance optimization for syntax highlighting
export ZSH_HIGHLIGHT_MAXLENGTH=60
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Load syntax highlighting last for better performance
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Yazi file manager function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias copybranch='git rev-parse --abbrev-ref HEAD | pbcopy'
alias copy='pbcopy'

# If you still need NVM occasionally but don't want it slowing startup,
# uncomment this function to load NVM only when you need it:
#
# nvm() {
#   unset -f nvm
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#   nvm "$@"
# }
