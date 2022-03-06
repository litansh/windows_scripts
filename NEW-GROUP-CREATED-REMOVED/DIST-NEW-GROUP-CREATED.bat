@echo off

del C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-NEW-GROUP-CREATED.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4749]" > file.txt >>C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-NEW-GROUP-CREATED.txt






wscript "C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-NEW-GROUP-CREATED-Notification.vbs"



