# Fixing driver install problem (Not enough storage space) when installing USB-Serial and Lexmark drivers)
Downloaded MS DOC (odt now) in ~\Downloads.  Describes setupapi logging.  Set HKLM\Software\MS\Windows\CurVer\Setup\logging level per highlighted.  40000401 IIRC, but that doesn't really make sense as a level.  -- *Finally set to 0x28003120 which looks good to me.*

- sfc /scannow crashed.  /verifyonly is running. hopefully it will figure something out.
```
Beginning system scan.  This process will take some time.

Beginning verification phase of system scan.
Verification 60% complete.

Windows Resource Protection could not perform the requested operation.
/
C:\Windows\INF>
```

## Ideally, dump largefiles off HDD, then can run UltraDefrag fasterer

- Huh? C:\windows\logs\cbs\cbs.log is 8MB and has rolled over in 2 hours? wtf?

## Windows Imaging 
`dism /online /cleanup-image /scanhealth` reports "The component store is repairable"

- Attempting dism /online /cleanup-image /restorehealth
Fails because `The source files could not be downloaded. 0x800f0906` 

At some point, look at other dism options: /resetbase for example.

Safe mode repair didn't work either.

- Downloaded Windows 10 iso to desktop, mounted it as D:\
  - Trying dism /online /cleanup-image /restorehealth /source:esd:d:\sources\install.esd
  - Didn't get through, couldn't figure out syntax

- http://www.tomshardware.com/faq/id-3016011/repair-corrupted-windows-image-dism.html says there might be more to the source, like a file:1 at the end or something.

# All's Well after upgrade to W10 Creators.  *W*ell, *T*hats *F*ixed

Todo: encryption/Vault