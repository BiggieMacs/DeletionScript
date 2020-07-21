#This script will move ARM Backups older than 30 days to a designated folder, then delete
#those items once they reach 60 days old.


#Generates the Get-TimeStamp function to add to .csv
function Get-TimeStamp {
   
    return "[{0:MM/dd/yyyy} {0:HH:mm:ss}]" -f (Get-Date)
   
}

#Places a timestamp in csv before run
Get-TimeStamp >>$LogsDelete
Get-TimeStamp >>$LogsMove

#Variables for each network location
$Source = "\\Location\of\source\data"
$Target = "\\Location\for\source\data\to\go"
$Delete = "\\same\location\as\target"
$LogsDelete = "\\Location\for\LOGS\DeletionLog.csv"
$LogsMove = "\\Location\for\LOGS\MoveLog.csv"

#Moves ARM's older than 30 days to Pending Deletion Folder
get-childitem -Path $Source |
    Where-Object {$_.CreationTime -lt (get-date).AddDays(-30)} |
    ForEach-Object {
        move-item -destination $Target | Out-File $LogsMove -Append
}
   

#Deletes ARM's Older than 45 days
Get-ChildItem $Delete -Recurse -Force -ea 0 |
    Where-Object {!$_.PsIsContainer -and $_.CreationTime -lt (Get-Date).AddDays(-60)} |
    ForEach-Object {
        $_ | del -Recurse -Force
        $_.FullName | Out-File $LogsDelete -Append
}
