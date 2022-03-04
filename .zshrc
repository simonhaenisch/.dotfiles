# brew env
eval $(`which brew` shellenv)

# exports
export EDITOR=nano # other options: 'sublw', 'codew'
export CLICOLOR=true
export LANG='en_US.UTF-8'

# set tab width
tabs -2

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE

# key bindings for history substring search (arrow up/down)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# key bindings for [fn] + arrow left/right
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# source other files
source ~/.aliases
source ~/.functions
source ~/.host-specific-zshrc

# source grc (for nice colors)
source `brew --prefix`/etc/grc.zsh

# source npm completions (allows to auto-complete npm scripts)
source <(npm completion)

# antibody
source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file

# customize prompt (see https://wiki.archlinux.org/index.php/zsh#Customized_prompt)
PROMPT='%(?.%F{green}.%F{red}❯%F{green})❯%f '
