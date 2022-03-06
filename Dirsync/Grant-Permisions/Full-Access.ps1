


$AdminUsername = "Beki@colmex.com"

$AdminPassword = "YourPass"

$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force

$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $AdminUsername,$SecurePassword

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell/" -Credential $cred -Authentication Basic -AllowRedirection

Import-PSSession $Session

Get-Mailbox -ResultSize unlimited -Filter {(RecipientTypeDetails -eq 'UserMailbox')} | Add-MailboxPermission -User 365-Admins@colmex.com -AccessRights FullAccess -InheritanceType all

wscript "C:\ProgramData\Scripts\Grant-Permisions\365-Grant-Full-Access-notification.vbs" 