complete -c bin/move2ssh -f

# Folders completion
complete -c bin/move2ssh -n "__fish_is_first_arg" -a "(find $HOME/.ssh -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"

# Options
complete -c bin/move2ssh -l help -s h -d 'Show help message'
complete -c bin/move2ssh -l list -s l -d 'List all directories'
complete -c bin/move2ssh -l move -s m -d 'Move existing files'
complete -c bin/move2ssh -l backup -s b -d 'Create backup'