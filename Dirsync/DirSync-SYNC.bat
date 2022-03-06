PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""C:\ProgramData\Scripts\DirSync-SYNC.ps1""' -Verb RunAs}"


wscript "C:\ProgramData\Scripts\DirSync-SYNC-Notification.vbs"