export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Pulumi
export PATH=$PATH:/home/$USER/.pulumi/bin

# pnpm
export PNPM_HOME="/home/$USER/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# bun completions
[ -s "/home/$USER/.bun/_bun" ] && source "/home/$USER/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# helix
alias hh="hx"
export EDITOR=hx

# dotnet
export PATH="$PATH:/home/$USER/.dotnet/tools"

# shortcuts
alias check="git checkout"
alias main="git checkout main"
alias pull="git pull"
alias stash="git stash"
alias pop="git stash pop"
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"

# Go to git root
alias root='cd $(git rev-parse --show-toplevel)'

# Syntax highlighting ZSH
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
# bitwarden path (app store install)
export SSH_AUTH_SOCK=/Users/$USER/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Disable highlights on longer texts, since syntax highlight slows down pasting
export ZSH_HIGHLIGHT_MAXLENGTH=60
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# .NET Core SDK
export DOTNET_ROOT=/usr/local/share/dotnet

# pnpm
export PNPM_HOME="/Users/jens/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}