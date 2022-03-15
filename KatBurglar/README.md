README.md

KatBurglar is a BashBunny payload that allows an attacker to run malicious binaries directly from the BB disc on the system through admin privileges. 

This payload borrows heavily from the PasswordGrabber payload, but will bypass Windows Defender. 

Make sure that you download the malicious binary (Mimikatz, Lazagne, your own implant.exe) and place it in the BashBunny "tools" folder. 

Update the script as needed with whatever binary you are trying to run. By default, KatBurglar will DCSync with Mimikatz. Switch out the command for sekurlsa::logonpasswords or similar if you want to dump local hashes. 

NOTE: The lazpayload.ps1 file utilizes powershell variables so it needs to be run as a PS1 script. The $ signs in the script confuse the BB so it must be called by a string to ran. 

You may have to play with the delays in order to get it working with other Windows systems. KatBurglar was tested on Server 2016 but should work on all Win 10 machines.

There is also a chance that Defender will delete your binaries after they run, even though they produce results. Simply load the binaries back into the BB before you run the payload again.

@assume-breach on twitter if you have problems. 
