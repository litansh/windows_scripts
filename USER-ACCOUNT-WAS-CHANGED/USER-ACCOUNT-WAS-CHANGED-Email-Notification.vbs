Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.colmex.com" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
'uncomment next three lines if you need to use SMTP Authorization
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "your-username"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "your-password"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic
objFlds.Update
objMail.Configuration = objConf
objMail.From = "UserChanged@ColmexEventAlert.com"
objMail.To = "SystemIL@cglms.com"
objMail.Subject = "USER-ACCOUNT-WAS-CHANGED "
objMail.TextBody = "Please Check Attachment"
objMail.AddAttachment "C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-CHANGED.htm"
objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing