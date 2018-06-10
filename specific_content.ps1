$filePath ="C:\Users\papa1\workspace\demo\a\dummny.txt"
$lineNumber=3;
$textToAdd="`r`n add to line 3"
$fileContent = Get-Content $filePath
$fileContent[$lineNumber-1] += $textToAdd
$fileContent | Set-Content $filePath