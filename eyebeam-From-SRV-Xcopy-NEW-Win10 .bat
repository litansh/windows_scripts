@echo off
net use x: \\ilfile01\eyebeam$\%username%

rmdir "C:\Users\%username%\AppData\Local\CounterPath\RegNow Enhanced" /S /Q

rmdir "C:\Users\%username%\AppData\Roaming\CounterPath Corporation\RegNow Enhanced" /S /Q

xcopy x:\ "C:\Users\%username%\AppData\Local\CounterPath" /D /E /V /C /I /F /H /R /K /Y

xcopy x:\ "C:\Users\%username%\AppData\Roaming\CounterPath Corporation" /D /E /V /C /I /F /H /R /K /Y /S

net use x: /delete /Y

