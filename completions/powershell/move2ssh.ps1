Register-ArgumentCompleter -Native -CommandName bin/move2ssh -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    
    $folders = Get-ChildItem "$env:USERPROFILE\.ssh" -Directory | Select-Object -ExpandProperty Name
    $options = @('--help', '--h', '--list', '--l', '--move', '--m', '--backup', '--b')
    
    if ($wordToComplete -match '^-') {
        $options | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    } else {
        $folders | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    }
}