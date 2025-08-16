export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH=$PATH:$HOME/.pulumi/bin
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export EDITOR=hx
export DOTNET_ROOT=/usr/local/share/dotnet
export PATH="$PATH:$HOME/.dotnet/tools"
export SSH_AUTH_SOCK=$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
export ZSH_HIGHLIGHT_MAXLENGTH=60

alias hh="hx"
alias nv="nvim"
alias check="git checkout"
alias main="git checkout main"
alias stable="git checkout stable"
alias pull="git pull"
alias stash="git stash"
alias pop="git stash pop"
alias root='cd $(git rev-parse --show-toplevel)'
alias dotfiles='cd $HOME/proj/pers/dotfiles'
alias vault='cd $HOME/proj/pers/vault'
alias jb='cd $HOME/proj/elk/jensbech-repo'
alias elk='cd $HOME/proj/elk'
alias cpdirname='basename "$PWD" | pbcopy'
alias kb='kubectl'
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"
alias dn="dotnet"
alias copybranch='git rev-parse --abbrev-ref HEAD | pbcopy'
alias copy='pbcopy'
alias brew-apply="brew bundle --file=/Users/$USER/proj/pers/dotfiles/Brewfile --cleanup"

zstyle ':bracketed-paste-magic' active-widgets '.self-*'


# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
