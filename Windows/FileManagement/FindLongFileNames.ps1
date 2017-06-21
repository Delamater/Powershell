cmd /c dir \\caix3irvrepo\X3\Documentation\DiskSpeedResults /s /b |?{$_.length -gt 260} >c:\temp\FilesLongerThan260.txt
