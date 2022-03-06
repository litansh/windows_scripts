# Ask for user reason.
$reason = Read-Host -Prompt 'You cannot login to server without provide the reason. Why are you logging on? '
$reason = $(whoami)
# Write reason to Event Log
Write-EventLog -LogName Application -Source WSH -EventID 666 -EntryType Information -Message "User provided reason '$reason' for logon."



$reason |  Out-File C:\ProgramData\reason.txt

# If reason is less than 10 characters, consider it unacceptable, and log the user off.
if ($reason.length -lt 15) {
    Write-Host "Reason not good enough (or blank)!"
    logoff.exe
}

