HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
KEYTIMEOUT=1

# Change cursor shape for different vi modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
        echo -ne '\e[2 q'  # Block cursor
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = '' ]] ||
         [[ $1 = 'beam' ]]; then
        echo -ne '\e[6 q'  # Beam cursor
    fi
}
zle -N zle-keymap-select

# Set beam cursor on startup
echo -ne '\e[6 q'

# Reset to beam cursor when pressing enter
zle-line-init() {
    echo -ne "\e[6 q"
}
zle -N zle-line-init


# The following lines were added by compinstall
zstyle :compinstall filename '/home/cbarrett/.config/zsh/.zshrc'

# prompt
source ~/.config/zsh/prompt.zsh
PROMPT="%F{yellow}%m%f %F{green}\$(fish_style_pwd)%f%(?..%F{red}%B [%?]%b%f)%F{yellow}>%f "

# plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/plugins/zsh-abbr/zsh-abbr.zsh

# Add completions to fpath
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)

# Initialize completions
autoload -Uz compinit && compinit

# Accept with Ctrl+E (end of line, like Emacs)
bindkey '^E' autosuggest-accept

# Bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Make unknown commands only red, not bold
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

eval "$(zoxide init zsh)"

# exports
export EDITOR="/home/utils/neovim-0.11.2/bin/nvim"
export VISUAL="/home/utils/neovim-0.11.2/bin/nvim"
export PAGER="less"
# for LSF
export LSF_LIBDIR=/usr/local/lsf/lib
export LSF_SERVERDIR=/usr/local/lsf/etc
export MANPATH="${MANPATH:+${MANPATH}:}/usr/local/lsf/man"
export LSB_DEFAULTPROJECT=atg_meth_atg_dftm
# verdi & others
export LM_LICENSE_FILE=/home/tools/admin/license_files
export VCS_HOME=/home/tools/vcs/2025.06
# claude code
export ANTHROPIC_AUTH_TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJpZCI6ImQxMGI3MzYyLTZjM2UtNDU2OS1hNWE1LTY3YzEyNTA5NWU0MSIsInNlY3JldCI6IlZ4V0VWaDY5KzZDQ3BsR1JDcHZnZFo0eUFOa3V3M0NyNXZ5S2xMaFA0N2s9In0.z2dwiKgj9_HbV7oE0uPfRgCKoUPG2IjAT9ogQbXJ6zc
export ANTHROPIC_BASE_URL=https://llm-proxy.perflab.nvidia.com/anthropic

# aliases
alias e='${EDITOR}'
alias ef='${EDITOR} $(fzf)'
alias enotes='${EDITOR} ~/notes/notes.typ'
alias zrc='${EDITOR} ${ZDOTDIR}/.zshrc'
alias szrc='source ${ZDOTDIR}/.zshrc'

# abbreviations
ABBR_SET_EXPANSION_CURSOR=1
