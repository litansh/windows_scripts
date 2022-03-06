@echo off

del C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4740]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked.txt






wscript "C:\ProgramData\IT-Scripts\USER-ACCOUNT-WAS-LOCKED-OUT\USER-ACCOUNT-WAS-LOCKED-OUT-Email-Notification.vbs"



