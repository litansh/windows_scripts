
del C:\ProgramData\Scripts\365-BCKP\365-BCKP.csv

$AdminUsername = "Beki@puzimuzi.com"

$AdminPassword = "12345678"

$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force

$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $AdminUsername,$SecurePassword

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell/" -Credential $cred -Authentication Basic -AllowRedirection 

Import-PSSession $Session -AllowClobber


Get-mailbox | select DisplayName,RecipientType,EmailAddresses | Export-Csv C:\ProgramData\Scripts\365-BCKP\365-BCKP.csv
Get-contact | select displayname,RecipientType,WindowsEmailAddress | Export-Csv C:\ProgramData\Scripts\365-BCKP\365-BCKP.csv
Get-DistributionGroup | select displayname,RecipientType,emailaddresses | Export-Csv C:\ProgramData\Scripts\365-BCKP\365-BCKP.csv

Remove-PSSession $Session

wscript "C:\ProgramData\Scripts\365-BCKP\365-BCKP-notification.vbs" 