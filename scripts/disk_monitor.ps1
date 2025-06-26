# Disk Monitoring Script
# Logs disk usage to a file and displays it on the console

# Configuration
$LogFile = "C:\Logs\disk_monitor.log"
$IntervalSeconds = 5

# Ensure the log file exists
function Ensure-LogFile {
    if (!(Test-Path $LogFile)) {
        Write-Host "Log file $LogFile does not exist. Creating it..."
        New-Item -ItemType File -Path $LogFile -Force | Out-Null
    }
}

# Function to get disk usage
function Get-DiskUsage {
    Get-PSDrive | Where-Object {$_.Used -ne $null} | ForEach-Object {
        "Drive: $($_.Name), Used: $([math]::Round($_.Used / 1GB, 2)) GB, Free: $([math]::Round($_.Free / 1GB, 2)) GB"
    }
}

# Function to log disk usage
function Log-DiskUsage {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $DiskUsage = Get-DiskUsage
    $LogEntry = "$Timestamp - Disk Usage:`n$DiskUsage"

    Write-Host $LogEntry
    Add-Content -Path $LogFile -Value $LogEntry
}

# Function to monitor disk usage
function Monitor-DiskUsage {
    Ensure-LogFile

    while ($true) {
        try {
            Log-DiskUsage
        } catch {
            Write-Host "An error occurred: $_" -ForegroundColor Red
        }

        Start-Sleep -Seconds $IntervalSeconds
    }
}

# Start monitoring
Monitor-DiskUsage
