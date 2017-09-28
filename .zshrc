# exports
export EDITOR='sublw' # or 'codew'
export CLICOLOR=true
export LANG='en_US.UTF-8'

# antibody
source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle sindresorhus/pure

# customize prompt (see https://wiki.archlinux.org/index.php/zsh#Customized_prompt)
PROMPT='%(?.%F{green}.%F{red}❯%F{green})❯%f '

# set tab width to 2
tabs -2

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# key bindings for history substring search (arrow up/down)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# key bindings for [fn] + arrow left/right
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# sourc grc (for nice colors)
source `brew --prefix`/etc/grc.zsh

# load other files
source ~/.aliases
source ~/.functions
source ~/.host-specific-zshrc
