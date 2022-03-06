@echo off


del C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked.txt
del C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked-3Lines.txt
del C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked-2Lines.txt



wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4740]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked.txt


findstr /c:"Account Name" /c:"Caller" C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked.txt >> C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked-3Lines.txt
timeout /t 3
findstr /v /C:"DC01$" C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked-3Lines.txt >> C:\ProgramData\IT-Scripts\EVENT_ID\User-Account-Was-Locked-2Lines.txt


wscript "C:\ProgramData\IT-Scripts\USER-ACCOUNT-WAS-LOCKED-OUT\USER-ACCOUNT-WAS-LOCKED-OUT-Email-Notification.vbs"