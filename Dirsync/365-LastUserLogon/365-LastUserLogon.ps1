del C:\ProgramData\Scripts\365-LastUserLogon\LastUserLogon.csv
$AdminUsername = "Office365@cglms.com"
$AdminPassword = "2sr7gHtvGK6DzA9psmNdbsHB"
$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $AdminUsername,$SecurePassword
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell/" -Credential $cred -Authentication Basic -AllowRedirection 
Import-PSSession $Session -AllowClobber
get-mailbox -RecipientTypeDetails usermailbox | Get-MailboxStatistics | where {$_.Lastlogontime -lt (get-date).AddDays(-50)} | Select displayName,LastLogonTime | Export-Csv C:\ProgramData\Scripts\365-LastUserLogon\LastUserLogon.csv -NoTypeInformation
Remove-PSSession $Session

wscript "C:\ProgramData\Scripts\365-LastUserLogon\365-LastUserLogon-Notification.vbs"