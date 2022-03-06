@echo off

del C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Added-To-Group.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4751]" > file.txt >>C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Added-To-Group.txt






wscript "C:\ProgramData\IT-Scripts\Groups-Member-Alerts\User-Added-To-Group-Notification.vbs"



