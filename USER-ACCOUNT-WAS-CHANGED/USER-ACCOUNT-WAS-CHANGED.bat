@echo off

del C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-CHANGED.htm




wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4738]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-CHANGED.htm







wscript "C:\ProgramData\IT-Scripts\USER-ACCOUNT-WAS-CHANGED\USER-ACCOUNT-WAS-CHANGED-Email-Notification.vbs"



