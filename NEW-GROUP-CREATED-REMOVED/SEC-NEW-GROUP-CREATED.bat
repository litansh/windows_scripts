@echo off

del C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\SEC-NEW-GROUP-CREATED.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4730]" > file.txt >>C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\SEC-NEW-GROUP-CREATED.txt






wscript "C:\ProgramData\IT-Scripts\NEW-GROUP-CREATED-REMOVED\SEC-NEW-GROUP-CREATED-Notification.vbs"



