# DeletionScript
Powershell script to Move items to folder after X days then after X days delete them Based off creation date.

Be sure to change the locations for the variables in the script. The placeholder are shown as a network location.
If you want to use a local resource just use the drive letters. ex. C:\users\User\documents\
For the logs locations for the Delete and Move feel free to rename these as you see fit. You can also use .txt instead of .csv if you prefer.

$Source = "\\Location\of\source\data"
$Target = "\\Location\for\source\data\to\go"
$Delete = "\\same\location\as\target"
$LogsDelete = "\\Location\for\LOGS\DeletionLog.csv"
$LogsMove = "\\Location\for\LOGS\MoveLog.csv"
