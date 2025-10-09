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

# BWS projects
export BORED_GODS_DEV_BWS_PROJECT_ID="b2966547-03f3-4bf5-b5d3-b3680127a5a7"

alias h="hx"
alias nv="nvim"
alias check="git checkout"
alias main="git checkout main"
alias stable="git checkout stable"
alias pull="git pull"
alias stash="git stash"
alias pop="git stash pop"
alias root='cd $(git rev-parse --show-toplevel)'
alias dotfiles='cd $HOME/proj/pers/dotfiles'
alias notes='cd $HOME/proj/pers/notes'
alias toolbox='cd $HOME/proj/pers/toolbox'
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
alias j='just'
alias cat='bat'
alias f='fzf | xargs -r hx'
alias knis="k9s"
alias z="zed"

alias ghw='~/proj/pers/toolbox/github/run-workflow.sh'

alias ld='eza -lD --group-directories-first --color=always --icons'
alias lf='eza -lF --color=always --group-directories-first --icons | grep -v "/$"'
alias lh='eza -ld .* --group-directories-first --color=always --icons'
alias ll='eza -al --group-directories-first --color=always --icons'
alias l='eza -al --group-directories-first --color=always --icons'
alias ls='eza -alF --color=always --group-directories-first --icons --sort=size | grep -v "/$"'
alias lt='eza --tree --color=always --icons'
alias lt1='eza --tree --level=1 --color=always --icons'


alias curl="curlie"

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
