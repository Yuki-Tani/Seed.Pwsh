$ProjectRoot = $PSScriptRoot
$PwshRoot = Join-Path $ProjectRoot 'pwsh'

# Load shared functions here
# . $ProjectRoot\xxx.ps1

# Export functions which has the same name as the file
Get-ChildItem -Path $PwshRoot\*.ps1 -Recurse `
| % {
    . $_.FullName;
    Export-ModuleMember -Function $_.BaseName;
}

# Export aliases if the script file has $Alias
Get-ChildItem -Path $PwshRoot\*.ps1 -Recurse `
| % {
    $Alias = "";
    . $_.FullName;
    if ($Alias -eq "") { return; }

    $CommandName = $_.BaseName
    $Alias | % {
        Set-Alias $_ $CommandName -Option Readonly;
        Export-ModuleMember -Alias $_;
    }
}