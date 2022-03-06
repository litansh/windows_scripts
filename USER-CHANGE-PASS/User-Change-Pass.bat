
del C:\ProgramData\IT-Scripts\EVENT_ID\User_Attempt_to_Change_Password.txt


wevtutil qe security /rd:true /f:text /c:1 /q:"*[System/EventID=4723]" > file.txt >>C:\ProgramData\IT-Scripts\EVENT_ID\User_Attempt_to_Change_Password.txt




wscript "C:\ProgramData\IT-Scripts\User-Change-Pass\User-Change-Pass-Email-Notification.vbs"



