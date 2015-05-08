setopt share_history
setopt HIST_IGNORE_ALL_DUPS
export KEYTIMEOUT=1

# color configuration
export TERM=xterm-256color
eval `dircolors -b ~/.dircolors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# homeshick main function
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# homeshick completions
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
#homeshick --quiet refresh 10

# load zgen
source "${HOME}/.zgen/zgen.zsh"
export ZGEN_PLUGIN_UPDATE_DAYS=10

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/adb
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/nmap
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load trapd00r/zsh-syntax-highlighting-filetypes
    zgen load zsh-users/zsh-history-substring-search
    zgen load supercrabtree/k
    zgen load djui/alias-tips
    #zgen load secrettriangle/smart-cd
    zgen load marzocchi/zsh-notify
    zgen load jocelynmallon/zshmarks
    zgen load Tarrasch/zsh-bd
    zgen load willghatch/zsh-snippets

    # completions
    zgen load zsh-users/zsh-completions src
    #zgen load unixorn/autoupdate-zgen

    # theme
    zgen load willghatch/zsh-hooks
    zgen load willghatch/zsh-megaprompt
    #zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi


#bindkey -v
#bindkey '^r' history-incremental-search-backward

#using renamer.vim plugin
alias mmv='nvim -c Renamer'
alias sub='subliminal -l en -s -f --'
alias j="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"

