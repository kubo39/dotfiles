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
