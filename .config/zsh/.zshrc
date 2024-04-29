# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# FZF - https://wiki.archlinux.org/index.php/Fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias git-show-remote-branches="
git for-each-ref \
--sort=-committerdate refs/remotes \
--format=' \
%(authordate:short) \
%(color:red)%(objectname:short)%(color:reset) \
%(color:yellow)%(refname:short)%(color:reset) \
- %(contents:subject) \
- %(color:red)%(authorname)%(color:reset) \
(%(color:green)%(committerdate:relative)%(color:reset))'"

emacs() {
  /usr/bin/emacs "$@" > /dev/null 2>&1 &
}

alias ee="/usr/bin/emacs -nw"
alias vim="nvim"

# direnv setup
eval "$(direnv hook zsh)"

# babashka tab completion
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb
