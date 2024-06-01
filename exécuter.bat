@echo off

copy /b GG.asm GG.obj

copy /b GG.obj +, GG.exe


GG.exe


del GG.obj GG.exe

REM if you change the name of the GG.asm make shore to change all of GG here to the name of the asm file
