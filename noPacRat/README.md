README.md

noPacRat is an automated powershell based version of the SamAccount Spoofing NoPac exploit (CVE-2021-42278 and CVE-2021-42287). 

noPacRat utilizes several pieces of code that are already out there such as FatRodzianko's AMSI bypass, rcardojba's Invoke-noPac and the Empire Windows Credential Manager dump script. I've chained these all together and made a few modifications to get past AMSI and Windows Defender. 

The script will bypass AMSI/Windows Defender and dump any saved creds from the Windows Credential Manager. It will then take those creds and run them against Invoke-noPac for a fully automated way to get a TGT from the DC. 

CONSIDERATIONS

In order for this to work, there are several things that must go right. The first is that the DC must be vulernable to the exploit. For testing, Windows Server 2019 and below are vulnerable out of box and up to the KB5008380 and KB5008602 security patches. Also a valid stored domain credential must be in Windows Credential Manager. 

![](nopacratdemo.gif)
