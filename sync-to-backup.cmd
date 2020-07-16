Echo "Starting sync to backup server"

start /wait /B "sync_to_backup" robocopy "C:\ProgramData\KasperskySC\SC_Backup" "\\hqsrvwinpbk84\nonsap\SC_Backup" /r:60 /w:5 /PURGE /MIR /MT:64 /LOG+:c:\tmp\sc_backup.txt

Echo "Done"