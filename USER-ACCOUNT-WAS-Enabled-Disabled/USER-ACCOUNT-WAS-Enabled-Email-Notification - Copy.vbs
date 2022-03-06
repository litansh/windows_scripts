Set oShell = WScript.CreateObject("WSCript.shell")
oShell.run "cmd cd /d wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4722]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-Enable11.txt"


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
objMail.From = "User-Enabled@cglms.com.com"
objMail.To = "gennady@colmex.com"
objMail.Subject = "USER-ACCOUNT-Enable "
objMail.TextBody = "Please Check Attachment"
objMail.AddAttachment "C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-enable11.txt"
objMail.Send
Set objFlds = Nothing
Set objConf = Nothing
Set objMail = Nothing