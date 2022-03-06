@echo off

del C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\NEW-USER-CREATED.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4720]" > file.txt >>C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\NEW-USER-CREATED.txt






wscript "C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\NEW-USER-CREATED-Notification.vbs"



