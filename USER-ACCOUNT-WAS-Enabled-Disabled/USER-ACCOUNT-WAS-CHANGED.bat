@echo off

del C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-Enable.txt




wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4722]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-WAS-Enable.txt







wscript "C:\ProgramData\IT-Scripts\USER-ACCOUNT-WAS-Enabled-Disabled\USER-ACCOUNT-WAS-Enabled-Email-Notification.vbs"



