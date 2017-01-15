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


#
# Prompt
#
autoload vcs_info
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
autoload -U compinit; compinit


#
# Local Settings
#
if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi