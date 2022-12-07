###############################################################################

### GLOBAL SETTINGS ###########################################################

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment to enable automatic upgrades
#DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Set language
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

# Set default editor
export EDITOR='vim'
export VISUAL='vim'

# Set AUTO_CD
setopt AUTO_CD

###############################################################################

### GLOBAL PATH ###############################################################

typeset -U path
path=(~/bin /usr/local/sbin $path[@])

###############################################################################

### HOMEBREW ###############################################################

# If Homebrew is installed
if type brew &>/dev/null; then

    # get brew path
    BREW_PREFIX=$(brew --prefix)

    # update shell path
    PATH="${BREW_PREFIX}/opt/curl/bin:${PATH}"
    PATH="${BREW_PREFIX}/opt/sqlite/bin:${PATH}"
    PATH="${BREW_PREFIX}/opt/ruby/bin:${PATH}"
    PATH="${BREW_PREFIX}/lib/ruby/gems/3.0.0/bin:${PATH}"
    #PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:${PATH}"
    #PATH="${BREW_PREFIX}/opt/findutils/libexec/gnubin:${PATH}"
    export PATH

    # enable completions
    export FPATH=${BREW_PREFIX}/share/zsh/site-functions:${FPATH}

fi

##############################################################################

### SERVICES ##################################################################

# Start keychain ssh-agent
if type keychain &>/dev/null; then
    eval $(keychain --eval --quiet --nogui --noask norville_at_github norville_at_gitlab)
fi

###############################################################################

### PLUGINS ###################################################################

[[ -f ${HOME}/.zsh/plugins.zsh ]] && . ${HOME}/.zsh/plugins.zsh

###############################################################################

### LISTING ############################################################

ls_colors="${HOME}/.config/dircolors/gruvbox"
if [ -f /etc/lsb-release ]; then
    eval "$(dircolors ${ls_colors})"
    alias ls='ls -v --color=auto'
else
    eval "$(gdircolors ${ls_colors})"
    alias ls='gls -v --color=auto'
fi

# set time format
timestyle='--time-style="+%Y-%m-%d %H:%M:%S"'

# set aliases
alias la="ls -halF ${timestyle}"    #
alias ll="ls -hAlF ${timestyle}"
alias lr="ls -hAlFR ${timestyle}"
alias lt="ls -hAlFt ${timestyle}"

###############################################################################

### ALIASES (last) ############################################################

# automatically run git against dotfiles bare repo
alias bdf="git --git-dir=${HOME}/.bdf.git --work-tree=${HOME}"

###############################################################################
