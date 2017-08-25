# exports
export EDITOR='sublw'
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

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# key bindings for [fn] + arrow left/right
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# apply grc
source `brew --prefix`/etc/grc.bashrc

# load other files
source .aliases
source .host-specific-zshrc
