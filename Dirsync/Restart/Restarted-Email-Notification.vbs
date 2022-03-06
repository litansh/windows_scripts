Dim objAdsSystemInfo, objComputerName, objMail, objConf, ObjFlds, strHostName, strIPAddress, WshNetwork, sDomain, oShell, sUserName, sComputerName, ObjIE, StrIP, Nic, NIC1, CompName, oNetwork, IPAddress, IPEnabled, DateInfo

Set objIE = CreateObject( "InternetExplorer.Application" )
      objIE.Navigate "http://ifconfig.me/ip"
Do Until objIE.ReadyState = 4 
      WScript.Sleep 100 
Loop 

Set WshNetwork = WScript.CreateObject("WScript.Network")
sDomain = WshNetwork.UserDomain 

Set objAdsSystemInfo = CreateObject("adsysteminfo")
Set objComputerName = GetObject("LDAP://" & objAdsSystemInfo.ComputerName)
Set objMail = CreateObject("CDO.Message")
Set objConf = CreateObject("CDO.Configuration")
Set objFlds = objConf.Fields

Set WshNetwork = WScript.CreateObject("WScript.Network")
sDomain = WshNetwork.UserDomain 

strIPAddress = objIE.Document.Body.all.tags("pre").[0].innertext
objIE.Quit

Set oNetwork = CreateObject("WScript.Network")
sUserName = oNetwork.UserName
sComputerName = oNetwork.ComputerName

 Set NIC1 = GetObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

 For Each Nic in NIC1

 if Nic.IPEnabled then

  StrIP = Nic.IPAddress(i)
  
  'MsgBox StrIP'

  Set WshNetwork = WScript.CreateObject("WScript.Network")

 CompName = WshNetwork.Computername
 
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.tradenet.local" 'your smtp server domain or IP address goes here
objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
objFlds.Update
objMail.Configuration = objConf

DateInfo = DateInfo & Now & vbCRLF
sComputerName = WshNetwork.ComputerName
sUserName = WshNetwork.UserName
sDomain = WshNetwork.UserDomain

objMail.From = "Restart@cglms.com"
objMail.To = "SrvRestart@cglms.com"
objMail.Subject = "Server " & sComputerName & " restarted !" 
objMail.TextBody = "The server has been restarted" & vbCRLF & "DateTime  : " & DateInfo & vbCRLF & "ComputerName  : " & sComputerName & vbCRLF & vbCRLF & "UserName  : " & sUserName & vbCRLF & "DomainName  : " & sDomain & vbCRLF & vbCRLF & "Lan IP address  : " & strIP & vbCRLF & "Wan IP Address  : " & StrIPAddress
objMail.Send
 End if
next