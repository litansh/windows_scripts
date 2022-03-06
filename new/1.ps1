$log = get-content C:\ProgramData\IT-Scripts\new\User-Account-Was-Locked.txt
foreach ($line in $log) { 
    if ($line -like "*Account Name:*") {
$line | out-file -FilePath "C:\ProgramData\IT-Scripts\new\User-Account-Was-Locked1.txt" -Append
    }
}