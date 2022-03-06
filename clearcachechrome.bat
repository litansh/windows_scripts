$Items = @('Cache\*','Cookies')
$Folder = "C:\Users\Walter\AppData\Local\Google\Chrome\User Data\Default"
$Items | % { 
    if (Test-Path "$Folder\$_") {
        Remove-Item -Force "$Folder\$_" 
    }
}