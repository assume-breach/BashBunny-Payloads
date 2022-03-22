README.md

noPacRat is an automated powershell based version of the SamAccount Spoofing NoPac exploit (CVE-2021-42278 and CVE-2021-42287). 

noPacRat utilizes several pieces of code that are already out there such as FatRodzianko's AMSI bypass, rcardojba's Invoke-noPac and the Empire Windows Credential Manager dump script. I've chained these all together and made a few modifications to get past AMSI and Windows Defender. 

The script will bypass AMSI/Windows Defender and dump any saved creds from the Windows Credential Manager. It will then take those creds and run them against Invoke-noPac for a fully automated way to get a TGT from the DC. Once you have the TGT you can choose your own adventure! Add a DA, get an elevated beacon, install DA level persistence, do whatever!

Usage:

1. Clone the noPacRat folder to the tools directory on the BB. 

2. Transfer the payload.txt file to whatever switch directory you want.

3. Transfer the asmi-opcode.ps1 script to the tools directory (not the noPacRat folder). This script needs to be run outside of the noPacRat.ps1 script or it will get flagged by AMSI.

4. Download PsExec.exe from Windows Internals and place it in the "Tools" directory.

5. Edit the payload.txt file to choose what you want after you get DA (add a DA, get an elevated shell, ect). I have provided a few POCs in the "ChooseYourAdventure" folder. You will need to play with the delays to get it to work. I have found that Q DELAY 38000 works well after the noPacRat.ps1 has run. 

CONSIDERATIONS

In order for this to work, there are several things that must go right. The first is that the DC must be vulernable to the exploit. For testing, Windows Server 2019 and below are vulnerable out of box and up to the KB5008380 and KB5008602 security patches. Also a valid stored domain credential must be in Windows Credential Manager. 

Credits: https://github.com/ricardojba https://github.com/FatRodzianko https://github.com/BeetleChunks
