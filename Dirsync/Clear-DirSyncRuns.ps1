param([int]$DaysToKeep=2)
# Get the local DirSync (FIM) server object
$DirSync = Get-WmiObject -Class "MIIS_SERVER" -Namespace "root\MicrosoftIdentityIntegrationServer"
# Clear runs older than $DaysToKeep, by default 2 days
$DirSync.ClearRuns([DateTime]::Today.AddDays(-$DaysToKeep)) | Format-Table ReturnValue
wscript "C:\ProgramData\Scripts\DirSync-Email-Notification.vbs" 