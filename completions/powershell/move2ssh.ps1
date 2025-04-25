@('bin/move2ssh', 'move2ssh') | ForEach-Object {
    Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)
        
        # Define the path to .ssh depending on the environment
        $sshPath = if ($env:WSLENV) {
            # For WSL
            "$env:USERPROFILE\.ssh"
        } else {
            # For regular PowerShell
            "$env:USERPROFILE\.ssh"
        }
        
        $folders = Get-ChildItem $sshPath -Directory | Select-Object -ExpandProperty Name
        $options = @(
            @{Name='--help'; Description='Show help message'},
            @{Name='--h'; Description='Show help message'},
            @{Name='--list'; Description='List all directories'},
            @{Name='--l'; Description='List all directories'},
            @{Name='--move'; Description='Move existing files'},
            @{Name='--m'; Description='Move existing files'},
            @{Name='--backup'; Description='Create backup'},
            @{Name='--b'; Description='Create backup'}
        )
        
        if ($wordToComplete -match '^-') {
            $options | ForEach-Object {
                if ($_.Name -like "$wordToComplete*") {
                    [System.Management.Automation.CompletionResult]::new(
                        $_.Name,
                        $_.Name,
                        'ParameterValue',
                        $_.Description
                    )
                }
            }
        } else {
            $folders | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
                [System.Management.Automation.CompletionResult]::new(
                    $_,
                    $_,
                    'ParameterValue',
                    "SSH configuration folder: $_"
                )
            }
        }
    }
}