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
to append an alias, be sure to add this to your shell config
tar_dpkg() {
    /PATH/TO/tar_dpkg.sh "$1"
}
then resource your .*rc file

#### example script execution:
```bash
➜  ~ tar_dpkg Downloads/pycharm-community-2024.2.3.tar.gz 
Starting installation/update process for Downloads/pycharm-community-2024.2.3.tar.gz...
Creating/Updating target directory Downloads/pycharm-community-2024.2.3.tar...
Cleaning up old files in Downloads/pycharm-community-2024.2.3.tar...
Extracting Downloads/pycharm-community-2024.2.3.tar.gz...
Extraction completed.
Navigated into Downloads/pycharm-community-2024.2.3.tar.
Searching for the first executable...
Executable found: ./pycharm-community-2024.2.3/jbr/bin/java
Parsed application name: pycharm
Checking for an icon named after the application...
Found named icon: /home/jj/Downloads/pycharm-community-2024.2.3.tar/./pycharm-community-2024.2.3/bin/pycharm.png
Creating/Updating a desktop entry for pycharm...
Desktop entry created/updated: /home/jj/.local/share/applications/pycharm.desktop
Application pycharm installed/updated successfully!
➜  ~ 

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
## epub to pdf converter
script to convert epub files to pdf
#### example:

```bash
 ~ ./epub_to_pdf.sh PARK,\ DAN\ -\ Python\ Crash\ Course\ _\ A\ Complete\ Beginner\'s\ Guide\ for\ Python\ Coding\ and\ Data\ Visualization.\ A\ Hands-On,\ Project-Based\ Introducti\ \(2020\)\ -\ libgen.li.epub \[Tech\ Today\]\ Jeff\ Duntemann\ -\ x64\ Assembly\ Language\ Step-by-Step_\ Programming\ with\ Linux\ \(2023,\ Wiley\)\ -\ libgen.li.epub
1% Converting input to HTML...
InputFormatPlugin: EPUB Input running
on /home/jj/PARK, DAN - Python Crash Course _ A Complete Beginner's Guide for Python Coding and Data Visualization. A Hands-On, Project-Based Introducti (2020) - libgen.li.epub
Parsing all content...
34% Running transforms on e-book...
Merging user specified metadata...
Detecting structure...
Flattening CSS and remapping font sizes...
Source base font size is 12.00000pt
Removing fake margins...
Cleaning up manifest...
Trimming unused files from manifest...
Trimming 'OEBPS/Image00001.jpg' from manifest
Creating PDF Output...
67% Running PDF Output plugin
The cover image has an id != "cover". Renaming to work around bug in Nook Color
68% Parsed all content for markup transformation
70% Completed markup transformation
90% Rendered all HTML as PDF
91% Added links to PDF content
Removed 1 unused fonts
Merged 26 instances of LiberationSerif-Bold reducing size from 163 KB to 19 KB
Merged 26 instances of LiberationSerif reducing size from 376.2 KB to 37.4 KB
Merged 2 instances of LiberationSerif-Italic reducing size from 5.8 KB to 5.2 KB
Merged 2 instances of LiberationSerif-BoldItalic reducing size from 7.7 KB to 7 KB
Merged 2 instances of DejaVuSans reducing size from 28.3 KB to 26 KB
100% Updated metadata in PDF
PDF output written to /home/jj/PARK, DAN - Python Crash Course _ A Complete Beginner's Guide for Python Coding and Data Visualization. A Hands-On, Project-Based Introducti (2020) - libgen.li.pdf
Output saved to   /home/jj/PARK, DAN - Python Crash Course _ A Complete Beginner's Guide for Python Coding and Data Visualization. A Hands-On, Project-Based Introducti (2020) - libgen.li.pdf
Successfully converted PARK, DAN - Python Crash Course _ A Complete Beginner's Guide for Python Coding and Data Visualization. A Hands-On, Project-Based Introducti (2020) - libgen.li.epub to PARK, DAN - Python Crash Course _ A Complete Beginner's Guide for Python Coding and Data Visualization. A Hands-On, Project-Based Introducti (2020) - libgen.li.pdf
1% Converting input to HTML...
InputFormatPlugin: EPUB Input running
on /home/jj/[Tech Today] Jeff Duntemann - x64 Assembly Language Step-by-Step_ Programming with Linux (2023, Wiley) - libgen.li.epub
Found HTML cover OPS/cover.xhtml
Parsing all content...
34% Running transforms on e-book...
Merging user specified metadata...
Detecting structure...
	Detected chapter: CHAPTER 1It's All in the Plan: Understanding What 
	Detected chapter: CHAPTER 2Alien Bases: Getting Your Arms Around Bin
	Detected chapter: CHAPTER 3Lifting the Hood: Discovering What Comput
	Detected chapter: CHAPTER 4Location, Location, Location: Registers, 
	Detected chapter: CHAPTER 5The Right to Assemble: The Process of Cre
	Detected chapter: CHAPTER 6A Place to Stand, with Access to Tools: L
	Detected chapter: CHAPTER 7Following Your Instructions: Meeting Mach
	Detected chapter: CHAPTER 8Our Object All Sublime: Creating Programs
	Detected chapter: CHAPTER 9Bits, Flags, Branches, and Tables: Easing
	Detected chapter: CHAPTER 10Dividing and Conquering: Using Procedure
	Detected chapter: CHAPTER 11Strings and Things: Those Amazing String
	Detected chapter: CHAPTER 12Heading Out to C: Calling External Funct
Flattening CSS and remapping font sizes...
Source base font size is 12.00000pt
Removing fake margins...
Cleaning up manifest...
Trimming unused files from manifest...
Trimming 'OPS/toc.ncx' from manifest
Creating PDF Output...
67% Running PDF Output plugin
The cover image has an id != "cover". Renaming to work around bug in Nook Color
68% Parsed all content for markup transformation
70% Completed markup transformation
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
90% Rendered all HTML as PDF
91% Added links to PDF content
Merged 46 instances of LiberationSans-Bold reducing size from 447.7 KB to 32.3 KB
Merged 50 instances of LiberationSerif reducing size from 812.5 KB to 42.1 KB
Merged 42 instances of LiberationSerif-Italic reducing size from 304.7 KB to 31.6 KB
Merged 36 instances of LiberationMono reducing size from 302.9 KB to 30.3 KB
Merged 36 instances of LiberationSerif-Bold reducing size from 230.2 KB to 32.1 KB
Merged 28 instances of LiberationSans-BoldItalic reducing size from 147.4 KB to 26.1 KB
Merged 12 instances of DejaVuSans reducing size from 174.6 KB to 26.9 KB
Merged 2 instances of LiberationSerif-BoldItalic reducing size from 7.1 KB to 6.4 KB
Merged 2 instances of LiberationMono-Bold reducing size from 6.4 KB to 5.8 KB
Merged 4 instances of LiberationMono-Italic reducing size from 11.9 KB to 5.7 KB
Removed 27 duplicate images
100% Updated metadata in PDF
PDF output written to /home/jj/[Tech Today] Jeff Duntemann - x64 Assembly Language Step-by-Step_ Programming with Linux (2023, Wiley) - libgen.li.pdf
Output saved to   /home/jj/[Tech Today] Jeff Duntemann - x64 Assembly Language Step-by-Step_ Programming with Linux (2023, Wiley) - libgen.li.pdf
Successfully converted [Tech Today] Jeff Duntemann - x64 Assembly Language Step-by-Step_ Programming with Linux (2023, Wiley) - libgen.li.epub to [Tech Today] Jeff Duntemann - x64 Assembly Language Step-by-Step_ Programming with Linux (2023, Wiley) - libgen.li.pdf
```
