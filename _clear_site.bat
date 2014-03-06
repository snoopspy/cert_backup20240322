@echo off

rem --------------------------------------------------------
rem delete site files
rem --------------------------------------------------------
del *.pem
del *.csr
del *.key
del *.crt
del .rnd

rem --------------------------------------------------------
rem remove rm_folder folder
rem --------------------------------------------------------
call  :rm_folder demoCA

rem --------------------------------------------------------
rem epilogue
rem --------------------------------------------------------
goto eof

rem --------------------------------------------------------
rem rm_folder
rem --------------------------------------------------------
:rm_folder
  set __path__=%1
  if not defined __path__ goto :eof
  for /f "tokens=*" %%I in ('dir /b /s /ad %__path__%*') do if %%~nxI==%__path__% (
    rmdir /s /q "%%I"
  )
goto eof

:eof
