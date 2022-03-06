Dim objEmail
Set objEmail = CreateObject("CDO.Message")

'************************************
'** Seting basic email information **
'************************************
Const EmailFrom = "GROUP-DELETED@cglms.com"
Const EmailTo = "systemil@cglms.com"
Const EmailSubject = "GROUP-DELETED"

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

'*******************************************************
'** Setting a text file to be shown in the email Body **
'*******************************************************
Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8
'** File to be inserted in Body
Const FileToBeUsed = "C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\GROUP-DELETED.txt"
Dim fso, f
Set fso = CreateObject("Scripting.FileSystemObject")
'** Open the file for reading
Set f = fso.OpenTextFile(FileToBeUsed, ForReading)
'** The ReadAll method reads the entire file into the variable BodyText
objEmail.Textbody = f.ReadAll
'** Close the file
f.Close
'** Clear variables
Set f = Nothing
Set fso = Nothing

'* cdoSendUsingPickup (1)
'* cdoSendUsingPort (2)
'* cdoSendUsingExchange (3)

'********************************
'** Parameters (DO NOT CHANGE) **
'********************************
ObjEmail.Configuration.Fields.Update
objEmail.Send