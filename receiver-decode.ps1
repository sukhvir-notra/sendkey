$EncodedFile = "C:\Users\sukhvir\Desktop\sent.txt"

$data = Get-Content $EncodedFile

[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($data)) > "C:\Users\sukhvir\Desktop\out.zip"