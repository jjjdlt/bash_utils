# bash_utils
miscellaneous bash scripts i've made while using linux
## tar unpackager script
automated tar file unpackaging and desktop menu entry creation. can be used for initial installs and subsequent updates
#### filetypes supported: [.tar, .tar.gz, .tar.bz2] 
#### example script execution:
```bash
➜  ~ ./tar_dpkg.sh Downloads/code-stable-x64-1728492644.tar.gz 
Starting installation/update process for Downloads/code-stable-x64-1728492644.tar.gz...
Creating/Updating target directory Downloads/code-stable-x64-1728492644.tar...
Cleaning up old files in Downloads/code-stable-x64-1728492644.tar...
Extracting Downloads/code-stable-x64-1728492644.tar.gz...
Extraction completed.
Navigated into Downloads/code-stable-x64-1728492644.tar.
Searching for the first executable...
Executable found: ./VSCode-linux-x64/libffmpeg.so
Parsed application name: code
Checking for an icon named after the application...
Found named icon: /home/jj/Downloads/code-stable-x64-1728492644.tar/./VSCode-linux-x64/resources/app/resources/linux/code.png
Creating/Updating a desktop entry for code...
Desktop entry created/updated: /home/jj/.local/share/applications/code.desktop
Application code installed/updated successfully!
```
## calendar script
automated the display of date, time, and a dynamic reminder of the current day everytime a new shell session is started.
#### example script execution:

```bash
---------------------------------------------
                  calendar                   
---------------------------------------------
Today's Date: Monday, October 21, 2024
Current Time: 01:23:00

 ______________
||            ||
||            ||
||            ||
||            ||
||____________||
|______________|
 \############\
  \############\
   \      ____    \   
    \_____\___\____\CA15    
--------------------------------------------
 Reminders: cse310 hw03 | interview@1:00pm
--------------------------------------------
➜  ~ 
```
