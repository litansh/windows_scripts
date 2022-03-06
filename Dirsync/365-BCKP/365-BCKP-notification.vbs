Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "192.168.60.230" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
'uncomment next three lines if you need to use SMTP Authorization
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "your-username"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "your-password"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic
objFlds.Update
objMail.Configuration = objConf
objMail.From = "365-BCKP@colmex.com"
objMail.To = "systemil@cglms.com"
objMail.Subject = "365 Beckup"
objMail.TextBody = "365 backup was created"
objMail.AddAttachment "C:\ProgramData\Scripts\365-BCKP\365-Mailbox.csv"
objMail.AddAttachment "C:\ProgramData\Scripts\365-BCKP\365-Contacts.csv"
objMail.AddAttachment "C:\ProgramData\Scripts\365-BCKP\365-Groups.csv"
objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing