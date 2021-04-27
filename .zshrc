#
# Keymap & Key Bindings
#
bindkey -e  # emacsモードで使う


#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=$HISTSIZE

setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt NO_beep

setopt transient_rprompt # http://www.machu.jp/diary/20130114.html

# http://kimoto.hatenablog.com/entry/2012/08/14/112500
local REPORTTIME=1

#
# Prompt
#
autoload -Uz vcs_info
precmd() {
  vcs_info
}
zstyle ':vcs_info:*' formats '[%s:%b]'
zstyle ':vcs_info:*' actionformats '[%s:%b|%a]'
setopt prompt_subst
PROMPT='%(?.%F{green}.%F{red})$ %f'
RPROMPT='%(?.%F{green}.%F{red})[%m:%1~]${vcs_info_msg_0_}%f'


#
# Completion
#
fpath+=~/.zfunc
autoload -Uz compinit
compinit -C


#
# Aliases
#
case ${OSTYPE} in
    freebsd*)
        alias ls="ls -GF"
        ;;
    linux*)
        alias ls="ls -F --color"
        ;;
esac

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'


#
# Local Settings
#
if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

# opam configuration
test -r /home/kubo39/.opam/opam-init/init.zsh && . /home/kubo39/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
# Wasmer
export WASMER_DIR="/home/kubo39/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
