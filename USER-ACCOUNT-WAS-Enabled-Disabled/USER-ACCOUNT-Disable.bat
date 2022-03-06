@echo off

del C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-disabled.txt




wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4725]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\USER-ACCOUNT-disabled.txt







wscript "C:\ProgramData\IT-Scripts\USER-ACCOUNT-WAS-Enabled-Disabled\USER-ACCOUNT-Disabled-Email-Notification.vbs"



