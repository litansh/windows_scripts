Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "192.168.60.230" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = "25" 'default port for email
'uncomment next three lines if you need to use SMTP Authorization
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "website@tefsec.com"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "NewPass1357*"
'objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic
objFlds.Update
objMail.Configuration = objConf
objMail.From = "website@tefsec.com"
objMail.To = "gennady@cglms.com"
objMail.Subject = "TEFS Job Application - John Fletcher - Signed by John Fletcher "
objMail.TextBody = "Test"

objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing