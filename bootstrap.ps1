<#
.SYNOPSIS
  Create a new project folder from a dev-kit scaffold. Files are copied out; dev-kit is never modified.
.EXAMPLE
  .\bootstrap.ps1 -Type python -Target D:\projects\freelance\my-project
#>
param(
    [Parameter(Mandatory)][ValidateSet('python', 'frontend', 'research')][string]$Type,
    [Parameter(Mandatory)][string]$Target
)

$ErrorActionPreference = 'Stop'
$Kit = $PSScriptRoot
$Scaffold = Join-Path $Kit "scaffolds\$Type"
$TargetFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Target)

if (-not (Test-Path $Scaffold)) { throw "Scaffold not found: $Scaffold" }
if (($TargetFull + '\').StartsWith($Kit + '\', [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Target must be outside dev-kit: $TargetFull"
}
if ((Test-Path $TargetFull) -and (Get-ChildItem -Force $TargetFull | Select-Object -First 1)) {
    throw "Target exists and is not empty: $TargetFull"
}

New-Item -ItemType Directory -Force -Path $TargetFull | Out-Null

# 1. Scaffold files (including dotfiles) go to the project root
Get-ChildItem -Force $Scaffold | Copy-Item -Destination $TargetFull -Recurse -Force

# 2. Personal layer, general rules, dispatcher, client handoff template
New-Item -ItemType Directory -Force -Path "$TargetFull\rules", "$TargetFull\dispatcher", "$TargetFull\docs" | Out-Null
Copy-Item "$Kit\CLAUDE.md" "$TargetFull\PERSONAL.md"
Copy-Item "$Kit\rules\DEV_RULES.md" "$TargetFull\rules\"
Copy-Item "$Kit\dispatcher\DISPATCHER.md" "$TargetFull\dispatcher\"
Copy-Item "$Kit\handoff\HANDOFF.md" "$TargetFull\docs\"

# 3. Project CLAUDE.md = scaffold CLAUDE.md with the personal layer imported first (UTF-8 without BOM)
$utf8 = New-Object System.Text.UTF8Encoding($false)
$project = [System.IO.File]::ReadAllText("$Scaffold\CLAUDE.md", $utf8)
[System.IO.File]::WriteAllText("$TargetFull\CLAUDE.md", "@PERSONAL.md`n`n$project", $utf8)

Write-Host "Created $Type project at $TargetFull"
Write-Host "Next:"
Write-Host "  1. cd $TargetFull ; git init"
Write-Host "  2. Fill in the Project section of CLAUDE.md and ROADMAP.md"
Write-Host "  3. If there is a .env.example: copy it to .env and fill in the values"
Write-Host "  4. Open the folder in Claude Code and run /memory to check that CLAUDE.md, PERSONAL.md,"
Write-Host "     rules/DEV_RULES.md and dispatcher/DISPATCHER.md are loaded"
