@echo off
SET PATH=%PATH%;"c:\Program Files\doxygen\"

rem Convert .pas to .cpp
pas2dox -o ..\DblMatrix.pas

rem Generate documentation
doxygen

rem Remove temporary file
del ..\DblMatrix.pas.cpp
