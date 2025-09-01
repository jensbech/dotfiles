export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# Homebrew (macOS & Linux)
if [[ "$(uname -s)" == "Darwin" ]]; then
	HOMEBREW_PREFIX="/opt/homebrew"
else
	HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

if command -v brew >/dev/null 2>&1; then
	eval "$(brew shellenv)" 2>/dev/null
elif [ -d "$HOMEBREW_PREFIX" ]; then
	export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
	export MANPATH="$HOMEBREW_PREFIX/share/man:${MANPATH:-}"
	export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"
fi

if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
	source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

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
alias cpbranchname='git rev-parse --abbrev-ref HEAD | pbcopy'
alias nb='git checkout -b'
alias kb='kubectl'
alias c="clear"
alias ww="cd $HOME && clear"
alias lg="lazygit"
alias ld="lazydocker"
alias dn="dotnet"
alias copy='pbcopy'

alias ld='eza -lD'
alias lf='eza -lF --color=always | grep -v /'
alias lh='eza -dl .* --group-directories-first'
alias ll='eza -al --group-directories-first'
alias ls='eza -alF --color=always --sort=size | grep -v /'
alias lt='eza --tree'

alias curl="curlie"


# alias ls="eza"
# alias ll="eza -l"

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
