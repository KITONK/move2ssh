# Define commands
complete -c bin/move2ssh -f
complete -c move2ssh -f

# Folders completion for both variants
complete -c bin/move2ssh -n "not __fish_seen_argument -l help -l h -l list -l l -l move -l m -l backup -l b" -a "(find $HOME/.ssh -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"
complete -c move2ssh -n "not __fish_seen_argument -l help -l h -l list -l l -l move -l m -l backup -l b" -a "(find $HOME/.ssh -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"

# Options for bin/move2ssh
complete -c bin/move2ssh -n 'not __fish_seen_argument -l help -l h' -l help -s h -d 'Show help message'
complete -c bin/move2ssh -n 'not __fish_seen_argument -l list -l l' -l list -s l -d 'List all directories'
complete -c bin/move2ssh -n 'not __fish_seen_argument -l move -l m' -l move -s m -d 'Move existing files'
complete -c bin/move2ssh -n 'not __fish_seen_argument -l backup -l b' -l backup -s b -d 'Create backup'

# Options for move2ssh
complete -c move2ssh -n 'not __fish_seen_argument -l help -l h' -l help -s h -d 'Show help message'
complete -c move2ssh -n 'not __fish_seen_argument -l list -l l' -l list -s l -d 'List all directories'
complete -c move2ssh -n 'not __fish_seen_argument -l move -l m' -l move -s m -d 'Move existing files'
complete -c move2ssh -n 'not __fish_seen_argument -l backup -l b' -l backup -s b -d 'Create backup'