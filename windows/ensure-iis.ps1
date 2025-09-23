# ensure-iis.ps1
# Script to auto-heal IIS service (W3SVC)
# Logs actions to C:\sre\autoheal.log

$logFile = "C:\sre\autoheal.log"

# Ensure log directory exists
if (!(Test-Path "C:\sre")) {
    New-Item -ItemType Directory -Path "C:\sre" | Out-Null
}

# Check IIS service status
$service = Get-Service W3SVC -ErrorAction SilentlyContinue
if ($service.Status -ne "Running") {
    Restart-Service W3SVC
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - IIS was down. Restarted automatically."
}

