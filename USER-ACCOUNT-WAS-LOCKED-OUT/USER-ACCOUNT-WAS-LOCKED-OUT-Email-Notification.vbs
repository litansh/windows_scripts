Dim objEmail
Set objEmail = CreateObject("CDO.Message")

'************************************
'** Seting basic email information **
'************************************
Const EmailFrom = "UserLocked@litan.com"
Const EmailTo = "litan.shamir@cglms.com"
'**Const EmailSubject = "User Account Was Locked"**


'***************************************
'** Setting Mail Server Configuration **
'***************************************
Const MailSendUsing = "2"
Const MailSendServer = "192.168.90.4"
Const MailSendPort = "25"
'Const MailSendUsername = "Muzi.Puzi@litan.local"
'Const MailSendPassword = "NewPass121!"
'Const MailSendAuthenticationType = "1"

'**************************************
'** Email Parameters (DO NOT CHANGE) **
'**************************************
objEmail.From = EmailFrom
objEmail.To = EmailTo
'**objEmail.Subject = EmailSubject**
objEmail.Textbody = EmailBody
objEmail.AddAttachment EmailAttachments
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = MailSendUsing
ObjEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = MailSendServer
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = MailSendPort
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = MailSendAuthenticationType
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = MailSendUsername
'objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = MailSendPassword


'*******************************************************
'** Setting a text file to be shown in the email Subject - Hen!!! **
'*******************************************************
Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8
'** File to be inserted in Subject
Const FileToBeUsed = "D:\IT\User-Account-Was-Locked-2Lines.txt"
Dim fso, f
Set fso = CreateObject("Scripting.FileSystemObject")
'** Open the file for reading
Set f = fso.OpenTextFile(FileToBeUsed, ForReading)
'** The ReadAll method reads the entire file into the variable BodyText
objEmail.Subject = f.ReadAll

'** Close the file
f.Close
'** Clear variables
Set f = Nothing
Set fso = Nothing


'*******************************************************
'** Setting a text file to be shown in the email Body **
'*******************************************************
Const ForReadingB = 1
Const ForWritingB = 2
Const ForAppendingB = 8
'** File to be inserted in Body
Const FileToBeUsedB = "D:\IT\User-Account-Was-Locked.txt"
Dim fsoB, fB
Set fsoB = CreateObject("Scripting.FileSystemObject")
'** Open the file for reading
Set fB = fsoB.OpenTextFile(FileToBeUsedB, ForReadingB)
'** The ReadAll method reads the entire file into the variable BodyText
objEmail.Textbody = fB.ReadAll

'** Close the file
fB.Close
'** Clear variables
Set fB = Nothing
Set fsoB = Nothing


'* cdoSendUsingPickup (1)
'* cdoSendUsingPort (2)
'* cdoSendUsingExchange (3)

'********************************
'** Parameters (DO NOT CHANGE) **
'********************************
ObjEmail.Configuration.Fields.Update
objEmail.Send