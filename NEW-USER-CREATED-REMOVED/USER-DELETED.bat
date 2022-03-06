@echo off

del C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\USER-DELETED.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4726]" > file.txt >>C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\USER-DELETED.txt






wscript "C:\ProgramData\IT-Scripts\NEW-USER-CREATED-REMOVED\USER-DELETED-Notification.vbs"



