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
objMail.From = "UserChengePass@cglms.com"
objMail.To = "SystemIL@cglms.com"
objMail.Subject = "User Change his Password "
objMail.TextBody = "Please Check Attachment"
objMail.AddAttachment "C:\ProgramData\IT-Scripts\EVENT_ID\User_Attempt_to_Change_Password.txt"
objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing