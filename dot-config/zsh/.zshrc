# main zsh settings. env in ~/.zprofile
# read second

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously


# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt auto_menu menu_complete # autocmp first menu match
# setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
# stty stop undef # disable accidental ctrl s

# history opts
setopt APPEND_HISTORY  # history appends rather than overwrites
setopt INC_APPEND_HISTORY # history is appended as soon as cmds executed
setopt SHARE_HISTORY # history shared across sessions
setopt HIST_IGNORE_SPACE # commands starting with space are not saved
setopt HIST_FIND_NO_DUPS # no duplicates from history search

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache

# fzf setup - https://wiki.archlinux.org/index.php/Fzf
source <(fzf --zsh) # allow for fzf history widget

# prompt 
PURE_GIT_PULL=0
autoload -U promptinit; promptinit
prompt pure # requires https://github.com/sindresorhus/pure

# aliases
alias l="ls -lh --color=auto --group-directories-first"
alias ll="ls -alh --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias nv="nvim"

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

## dockerized aliases
# alias aws='docker run --rm -it -v ~/.config/aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
# alias cljstyle='docker run -v $PWD:/app --rm abogoyavlensky/cljstyle cljstyle'

## node
# alias npm='docker run --rm -it --workdir /app -v $(pwd):/app node:slim npm'
# alias npx='docker run --rm -it --workdir /app -v $(pwd):/app node:slim npx'

# direnv setup
eval "$(direnv hook zsh)"

# babashka tab completion
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb
source /usr/share/nvm/init-nvm.sh
