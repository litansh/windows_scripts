

del C:\ProgramData\IT-Scripts\EVENT_ID\DHCP-FULL.htm

wevtutil qe System "/q:*[System [(EventID=1020)]]" /f:text /rd:true /c:1 > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\DHCP-FULL.htm



wscript "C:\ProgramData\IT-Scripts\DHCP-FULL\DHCP-FULL-Email-Notification.vbs" 



