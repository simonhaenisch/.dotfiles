# brew env
eval "$(/opt/homebrew/bin/brew shellenv)"

# exports
export EDITOR=nano # other options: 'sublw', 'codew'
export CLICOLOR=true
export LANG='en_US.UTF-8'

# set tab width
tabs -2

# history
HISTFILE=~/.zsh_history
HISTSIZE=12000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE SHARE_HISTORY

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

# zsh plugins via antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt

zstyle :prompt:pure:prompt:success color yellow
