@echo off

del C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-GROUP-DELETED.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4753]" > file.txt >>C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-GROUP-DELETED.txt






wscript "C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\DIST-GROUP-DELETED-Notification.vbs"



