::--------------------------------------------------
:: Modifies on : 20240819
:: By Meir.E
:: Menu in batch.
:: https://github.com/Meir-Tools | 
:: Meir-Tools | Functions | BATman.bat | https://github.com/Meir-Tools/Functions/blob/main/BATman.bat | 
:: Meir-Tools | Generals_Zero_Hour assist tools
::--------------------------------------------------
:: Run once , can run inly in batch file , Global
::--------------------------------------------------
@ECHO OFF & TITLE Meir-Tools & SET BATman=%USERPROFILE%\Documents\GitHub\Functions\BATman
if exist %BATman%.* ( echo %BATman% -^> Installed ) else ( echo %BATman% -^> Not Installed & PAUSE)
:: confs
set my_ip=10.0.0.0
set my_user=admin
set my_pass=pass
set lpath=%0
::--------------------------------------------------
:: Meir-Tools | set Global variables
::--------------------------------------------------
set vlc="C:\Program Files\VideoLAN\VLC\vlc.exe"
set putty="C:\Program Files\PuTTY\putty.exe"
set WinSCP="C:\Users\User\AppData\Local\Programs\WinSCP\WinSCP.exe"
set npp="C:\Program Files\Notepad++\notepad++.exe"
::--------------------------------------------------
:: Meir-Tools | Generals_Zero_Hour assist | set Global variables
::--------------------------------------------------
set Generals_Zero_Hour=Generals_Zero_Hour 
::--------------------------------------------------
:: Run once , can run inly in batch file , Global
::--------------------------------------------------
:Main
	::--------------------------------------------------
	:: Print Header | 
	::--------------------------------------------------
	CLS
	CALL %BATman% :MAN_Print_Meir_tools_Logo_shrinked1 %0
	ECHO MAN-MENU
	echo ----------------------------------------------------------------------
	::--------------------------------------------------
	::--------------------------------------------------
	:: Notes | 
	::--------------------------------------------------
	setlocal enabledelayedexpansion &REM Note , may find a way or a need to exit it by 'endlocal' somwhere in the code.
	FOR /F "tokens=1" %%F IN ('" "!vmrun!" getGuestIPAddress "!VMX_File!" "') DO set Result=%%F
	echo correnlty set ip: %my_ip% ^| %Result%
	echo correnlty screen Info
	wmic path Win32_VideoController get CurrentVerticalResolution , CurrentHorizontalResolution , VideoModeDescription &REM ref: https://superuser.com/questions/270718/get-display-resolution-from-windows-command-line
	::--------------------------------------------------
	:: Print Menu here
	::--------------------------------------------------
	CALL %BATman% :MAN_ShowMenu %0
	CALL :OPT%M% &REM replace here the IF %M%==1 GOTO OPT1 ...statements....
	::--------------------------------------------------
GOTO :Main
::--------------------------MAN Functions------------------------------------------------
:OPT1 | 1 - stop generals steam version
	set Prcss_name="game.dat"
	taskkill /IM %Prcss_name% /F
	pause
EXIT /B 0
:OPT2 | 2 - stop generals exe version
	set Prcss_name="generals.exe"
	taskkill /IM %Prcss_name% /F
	pause
EXIT /B 0
:OPT- | - - - - - - some beta and testing here - - - - - - - -  
	PAUSE
EXIT /B 0
:OPT0 | 0 - Some other example how to use this menu tool 
EXIT /B 0
:OPTE | E - Edit
	echo %lpath% &REM set lpath=%0 ::in top
	start "" "C:\Program Files\Notepad++\notepad++.exe" %lpath%
	pause
EXIT /B 0
:OPTI | I - Info
	cls
	CALL %BATman% :Info_About
	echo.
	echo This is Home Assistant Menu 
	pause 
EXIT /B 0
:OPTQ | Q - exit
	exit
EXIT /B 0
::---Functions------------------------------------------------
:fChk_print_install_status 
	set mpath="%~1"
	if exist %mpath% ( echo %mpath% -^> Installed ) else ( echo %mpath% -^> Not Installed )
EXIT /B 0
:fChknRun 
	set mpath="%~1"
	if exist %mpath% ( echo %mpath% -^> Installed & start "" %mpath% ) else ( echo %mpath% -^>Error-File Not Exist & pause )
EXIT /B 0

::-------------------------------------------------------------------------------------
::-------------------------------------------------------------------------------------
###
EXIT EXIT /B 1
###


vmd version 1.17.0 build-23775571

Usage: vmrun [AUTHENTICATION-FLAGS] COMMAND [PARAMETERS]



AUTHENTICATION-FLAGS
--------------------
These must appear before the command and any command parameters.

   -T <hostType> (ws|fusion||player)
   -vp <password for encrypted virtual machine>
   -gu <userName in guest OS>
   -gp <password in guest OS>



POWER COMMANDS           PARAMETERS           DESCRIPTION
--------------           ----------           -----------
start                    Path to vmx file     Start a VM or Team
                         [gui|nogui]

stop                     Path to vmx file     Stop a VM or Team
                         [hard|soft]

reset                    Path to vmx file     Reset a VM or Team
                         [hard|soft]

suspend                  Path to vmx file     Suspend a VM or Team
                         [hard|soft]

pause                    Path to vmx file     Pause a VM

unpause                  Path to vmx file     Unpause a VM



SNAPSHOT COMMANDS        PARAMETERS           DESCRIPTION
-----------------        ----------           -----------
listSnapshots            Path to vmx file     List all snapshots in a VM
                         [showTree]

snapshot                 Path to vmx file     Create a snapshot of a VM
                         Snapshot name

deleteSnapshot           Path to vmx file     Remove a snapshot from a VM
                         Snapshot name
                         [andDeleteChildren]

revertToSnapshot         Path to vmx file     Set VM state to a snapshot
                         Snapshot name



HOST NETWORK COMMANDS    PARAMETERS           DESCRIPTION
---------------------    ----------           -----------
listHostNetworks                              List all networks in the host

listPortForwardings      Host network name    List all available port forwardings on a host network


setPortForwarding        Host network name    Add or update a port forwarding on a host network
                         Protocol
                         Host port
                         Guest ip
                         Guest port
                         [Description]

deletePortForwarding     Host network name    Delete a port forwarding on a host network
                         Protocol
                         Host port




GUEST OS COMMANDS        PARAMETERS           DESCRIPTION
-----------------        ----------           -----------
runProgramInGuest        Path to vmx file     Run a program in Guest OS
                         [-noWait]
                         [-activeWindow]
                         [-interactive]
                         Complete-Path-To-Program
                         [Program arguments]

fileExistsInGuest        Path to vmx file     Check if a file exists in Guest OS
                         Path to file in guest

directoryExistsInGuest   Path to vmx file     Check if a directory exists in Guest OS
                         Path to directory in guest

setSharedFolderState     Path to vmx file     Modify a Host-Guest shared folder
                         Share name
                         Host path
                         writable | readonly

addSharedFolder          Path to vmx file     Add a Host-Guest shared folder
                         Share name
                         New host path

removeSharedFolder       Path to vmx file     Remove a Host-Guest shared folder
                         Share name

enableSharedFolders      Path to vmx file     Enable shared folders in Guest
                         [runtime]

disableSharedFolders     Path to vmx file     Disable shared folders in Guest
                         [runtime]

listProcessesInGuest     Path to vmx file     List running processes in Guest OS

killProcessInGuest       Path to vmx file     Kill a process in Guest OS
                         process id

runScriptInGuest         Path to vmx file     Run a script in Guest OS
                         [-noWait]
                         [-activeWindow]
                         [-interactive]
                         Interpreter path
                         Script text

deleteFileInGuest        Path to vmx file     Delete a file in Guest OS
                         Path in guest

createDirectoryInGuest   Path to vmx file     Create a directory in Guest OS
                         Directory path in guest

deleteDirectoryInGuest   Path to vmx file     Delete a directory in Guest OS
                         Directory path in guest

CreateTempfileInGuest    Path to vmx file     Create a temporary file in Guest OS

listDirectoryInGuest     Path to vmx file     List a directory in Guest OS
                         Directory path in guest

CopyFileFromHostToGuest  Path to vmx file     Copy a file from host OS to guest OS
                         Path on host
                         Path in guest

CopyFileFromGuestToHost  Path to vmx file     Copy a file from guest OS to host OS
                         Path in guest
                         Path on host

renameFileInGuest        Path to vmx file     Rename a file in Guest OS
                         Original name
                         New name

typeKeystrokesInGuest    Path to vmx file     Type Keystrokes in Guest OS
                         keystroke string

connectNamedDevice       Path to vmx file     Connect the named device in the Guest OS
                         device name

disconnectNamedDevice    Path to vmx file     Disconnect the named device in the Guest OS
                         device name

captureScreen            Path to vmx file     Capture the screen of the VM to a local file
                         Path on host

writeVariable            Path to vmx file     Write a variable in the VM state
                         [runtimeConfig|guestEnv|guestVar]
                         variable name
                         variable value

readVariable             Path to vmx file     Read a variable in the VM state
                         [runtimeConfig|guestEnv|guestVar]
                         variable name

getGuestIPAddress        Path to vmx file     Gets the IP address of the guest
                         [-wait]



GENERAL COMMANDS         PARAMETERS           DESCRIPTION
----------------         ----------           -----------
list                                          List all running VMs

upgradevm                Path to vmx file     Upgrade VM file format, virtual hw

installTools             Path to vmx file     Install Tools in Guest

checkToolsState          Path to vmx file     Check the current Tools state

deleteVM                 Path to vmx file     Delete a VM

clone                    Path to vmx file     Create a copy of the VM
                         Path to destination vmx file
                         full|linked
                         [-snapshot=Snapshot Name]
                         [-cloneName=Name]



Template VM COMMANDS     PARAMETERS           DESCRIPTION
---------------------    ----------           -----------
downloadPhotonVM         Path for new VM      Download Photon VM





Examples:


Starting a virtual machine with Workstation on a Windows host
   vmrun -T ws start "c:\my VMs\myVM.vmx"


Running a program in a virtual machine with Workstation on a Windows host with Windows guest
   vmrun -T ws -gu guestUser -gp guestPassword runProgramInGuest "c:\my VMs\myVM.vmx" "c:\Program Files\myProgram.exe"


Creating a snapshot of a virtual machine with Workstation on a Windows host
   vmrun -T ws snapshot "c:\my VMs\myVM.vmx" mySnapshot


Reverting to a snapshot with Workstation on a Windows host
   vmrun -T ws revertToSnapshot "c:\my VMs\myVM.vmx" mySnapshot


Deleting a snapshot with Workstation on a Windows host
   vmrun -T ws deleteSnapshot "c:\my VMs\myVM.vmx" mySnapshot


Enabling Shared Folders with Workstation on a Windows host
   vmrun -T ws enableSharedFolders "c:\my VMs\myVM.vmx"

C:\Program Files (x86)\VMware\VMware Player>