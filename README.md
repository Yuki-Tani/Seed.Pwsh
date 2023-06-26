# Seed.Pwsh

## Getting Started

1. update directory name and psm1 file name to the module name.
1. Add `yukit\psmodule` to environemt variable `PSModulePath`.
    ```pwsh
    Import-Module .\Yukit.psm1
    Add-YukitPwshModulePath D:\yukit\psmodule
    ```
1. Restart pwsh window