Dim objEmail
Set objEmail = CreateObject("CDO.Message")

'************************************
'** Seting basic email information **
'************************************
Const EmailFrom = "LowSpace@cglms.com "
Const EmailTo = "hen.g@cglms.com"
Const EmailSubject = "Low Disk Space in NLFile01"
Const EmailBody = "The Disk C:\ in NLFile01 has less than 3GB free space."
'***************************************
'** Setting Mail Server Configuration **
'***************************************
Const MailSendUsing = "2"
Const MailSendServer = "192.168.60.230"
Const MailSendPort = "25"
'Const MailSendUsername = "noreply@myserver.com"
'Const MailSendPassword = "mypassword"
'Const MailSendAuthenticationType = "1"

'**************************************
'** Email Parameters (DO NOT CHANGE) **
'**************************************
objEmail.From = EmailFrom
objEmail.To = EmailTo
objEmail.Subject = EmailSubject
objEmail.Textbody = EmailBody
objEmail.AddAttachment EmailAttachments
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = MailSendUsing
ObjEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = MailSendServer
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = MailSendPort
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = MailSendAuthenticationType
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = MailSendUsername
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = MailSendPassword

ObjEmail.Configuration.Fields.Update
objEmail.Send