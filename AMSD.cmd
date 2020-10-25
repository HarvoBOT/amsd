@echo off
title AMSD - Automatic Minecraft Server Deployer
:home
cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo 1) Download and install Server
echo 2) Start exsisting server
echo.
set /p beg= $ 
if %beg%==1 goto download
if %beg%==2 goto select

:select
cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Select server version.
set /p ver= Version : 
cd Servers\%ver%
start.cmd

:download
cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Select Jartype
echo Available Jartypes: vanilla, paper
echo.
set /p jar= Jartype : 


cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Select Version
echo.
set /p ver= Version : 

cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Downlading server jar with wget...
cd .amsd
wget http://34.89.48.29/%jar%/%ver%.jar
cd..
title AMSD - Automatic Minecraft Server Deployer
mkdir Servers\%ver%
move /y %ver%.jar Servers\%ver%
cd Servers\%ver%
echo eula=true> eula.txt
cls

:ram
cls
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Select your Minimum amount of RAM for %ver%.jar
echo.
set /p xms= Minium RAM : 
cls

echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Select your Maximum amount of RAM for %ver%.jar
echo.
set /p xmx= Maximum RAM : 
cls

echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Should AMSD create a start script for future references? ( y/n )
echo.
set /p script= Create start.bat : 
	if %script%==y goto start1
	if %script%==n goto start2

:start1
cls
echo java -jar -Xmx%xmx% -Xms%xms% %ver%.jar > start.cmd
java -jar -Xmx%xmx% -Xms%xms% %ver%.jar
echo
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo Server was stopped by user or crashed.
echo.
echo 1) Restart Server
echo 2) Back to home screen
echo 3) Enter new RAM values
echo 4) Exit AMSD
echo.
set /p choose= $ 
if %choose%==1 goto start2
if %choose%==2 goto home
if %choose%==3 goto ram
if %choose%==4 exit

:start2
cls
java -jar -Xmx%xmx% -Xms%xms% %ver%.jar

:error
echo
echo                                       +====================================+
echo                                         Automatic Minecraft Server Delpoyer
echo                                                        (AMSD)                
echo                                       +====================================+
echo.
echo An error occured. Returning to home screen in 4
timeout 1 >nul
echo An error occured. Returning to home screen in 3
timeout 1 >nul
echo An error occured. Returning to home screen in 2
timeout 1 >nul
echo An error occured. Returning to home screen in 1
timeout 1 >nul
goto home