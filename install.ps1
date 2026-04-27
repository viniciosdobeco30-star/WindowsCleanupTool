# Windows Cleanup Tool Installer
# This script installs the Windows Cleanup Tool to Program Files and adds it to PATH

param(
    [Parameter(Mandatory=$false)]
    [switch]$Silent = $false
)

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    if (-not $Silent) {
        Write-Host "ERROR: This installer must be run as Administrator." -ForegroundColor Red
        Write-Host "Please right-click and select 'Run as Administrator'." -ForegroundColor Yellow
        pause
    }
    exit 1
}

# Define paths
$InstallDir = "$env:ProgramFiles\WindowsCleanupTool"
$ScriptPath = "$InstallDir\cleanup.bat"
$ShortcutPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Windows Cleanup Tool.lnk"

try {
    if (-not $Silent) {
        Write-Host "Installing Windows Cleanup Tool..." -ForegroundColor Green
        Write-Host "Installation directory: $InstallDir" -ForegroundColor Cyan
    }

    # Create installation directory
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null

    # Copy the cleanup script
    $ScriptSource = Join-Path $PSScriptRoot "cleanup.bat"
    if (Test-Path $ScriptSource) {
        Copy-Item $ScriptSource $ScriptPath -Force
        if (-not $Silent) { Write-Host "Script copied to: $ScriptPath" -ForegroundColor Green }
    } else {
        throw "cleanup.bat not found in the same directory as install.ps1"
    }

    # Add to system PATH
    $CurrentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
    if ($CurrentPath -notlike "*$InstallDir*") {
        $NewPath = $CurrentPath + ";" + $InstallDir
        [Environment]::SetEnvironmentVariable("PATH", $NewPath, "Machine")
        if (-not $Silent) { Write-Host "Added to system PATH" -ForegroundColor Green }
    } else {
        if (-not $Silent) { Write-Host "Already in system PATH" -ForegroundColor Yellow }
    }

    # Create Start Menu shortcut
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($ShortcutPath)
    $Shortcut.TargetPath = $ScriptPath
    $Shortcut.WorkingDirectory = $InstallDir
    $Shortcut.Description = "Windows Cleanup and Performance Tool"
    $Shortcut.Save()

    if (-not $Silent) { 
        Write-Host "Start Menu shortcut created" -ForegroundColor Green
        Write-Host "`nInstallation completed successfully!" -ForegroundColor Green
        Write-Host "You can now run 'cleanup' from any command prompt, or use the Start Menu shortcut." -ForegroundColor Cyan
        Write-Host "Note: The tool requires administrator privileges to function properly." -ForegroundColor Yellow
        pause
    } else {
        Write-Host "Installation completed successfully."
    }

} catch {
    if (-not $Silent) {
        Write-Host "ERROR: Installation failed!" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        pause
    }
    exit 1
}
