# Baywatch aliases
alias b='baywatch'
alias bo='baywatch open'
alias bli='baywatch login'
alias blo='_baywatch_logout'
alias bs='baywatch setup'
alias bck='baywatch check'
alias bcka='baywatch check_all'


# Go Logout but for real
function _baywatch_logout() {
    for pid in $(ls /tmp/baywatch*.pid); do
        kill -9 $(cat $pid)
        rm $pid
    done
}

# Go to a client directory
function bsw() {
    if [ $# -eq 0 ]
    then
        cd $HOME/.baywatch/baywatch-dotfiles
        return
    fi
    cd $HOME/.baywatch/baywatch-dotfiles/$1
}

function _bsw() {
    local -a clients
    exclude=(bin 0-strat-tech)
    clients=($(ls -d $HOME/.baywatch/baywatch-dotfiles/*/ | xargs -n1 basename | grep -v -E $(echo ${exclude[@]} | tr ' ' '|')))
    _describe 'clients' clients
}
compdef _bsw bsw

# Get current client (i.e. the name of the first parent directory with a .baywatch subdirectory excluding the $HOME/.baywatch directory)
function _baywatch_current_dir() {
    local dir=$PWD
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/.baywatch" ]; then
            if [ "$dir" = "$HOME" ]; then
                return 1
            fi
            echo $(basename $dir)
            return
        fi
        dir=$(dirname "$dir")
    done
    return 1
}

# Prompt segment for the current client in p10k
function prompt_baywatch_client() {
  client=$(_baywatch_current_dir || return)
  [[ -n $client ]] && p10k segment -f cyan -i '🏖️' -t "$client"
}


# Open a client directory in vscode
function bvs() {
    if [ $# -eq 0 ]
    then
        code $HOME/.baywatch/baywatch-dotfiles
        return
    fi
    code $HOME/.baywatch/baywatch-dotfiles/$1
}

function _bvs() {
    local -a clients
    exclude=(bin 0-strat-tech)
    clients=($(ls -d $HOME/.baywatch/baywatch-dotfiles/*/ | xargs -n1 basename | grep -v -E $(echo ${exclude[@]} | tr ' ' '|')))
    _describe 'clients' clients
}
compdef _bvs bvs

# If baywatch is installed, generate the baywatch completion script using cobra
if command -v baywatch &> /dev/null
then
    baywatch completion zsh > "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/baywatch/_baywatch"
fi
