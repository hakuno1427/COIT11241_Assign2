Expand-Archive -Path "C:\Tools\AtomicRedTeam\atomics\T1036\bin\T1036.zip" -DestinationPath "C:\Tools\AtomicRedTeam\atomics\T1036\bin\Extracted" -Force
# Masquerading PowerShell script with provided readme content

# Define the file paths
$sourceFile = "C:\Tools\AtomicRedTeam\atomics\T1036\bin\Extracted\2.pdf"
$destinationFile = "C:\Tools\AtomicRedTeam\atomics\T1036\bin\Extracted\2.dll"

# Rename the file
Rename-Item -Path $sourceFile -NewName $destinationFile

# Execute the renamed file using rundll32
$command = "rundll32.exe $destinationFile, StartW"
Invoke-Expression $command

#Cleanup
taskkill /IM Calculator.exe /f >$null 2>$null
Remove-Item "C:\Tools\AtomicRedTeam\atomics\T1036\bin\Extracted\" -recurse -ErrorAction Ignore

