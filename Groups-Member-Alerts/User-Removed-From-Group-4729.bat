@echo off

del C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Removed-From-Group.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4729]" > file.txt >>C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Removed-From-Group.txt






wscript "C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Removed-From-Group-Notification.vbs"


