Option explicit
Dim objAdsSystemInfo, objComputerName, objMail, objConf, ObjFlds, strHostName, WshNetwork

Set objAdsSystemInfo = CreateObject("adsysteminfo")
Set objComputerName = GetObject("LDAP://" & objAdsSystemInfo.ComputerName)
Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields
Set WshNetwork = WScript.CreateObject("WScript.Network")

objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.tradenet.local" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
objFlds.Update
objMail.Configuration = objConf

strHostName = UCase(replace(objComputerName.Name,"CN=",""))

objMail.From = "RDPReason@cglms.com"
objMail.To = "it@cglms.com"
objMail.Subject = "Server " & WshNetwork.ComputerName & " rdp reason !"
objMail.TextBody = "Please check attached file with rdp reason " & Now
objMail.AddAttachment "C:\ProgramData\reason.txt"
objMail.Send