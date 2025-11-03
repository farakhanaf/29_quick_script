@echo off
:: =======================================
::    29 Solutions Quick Script v1.15
:: =======================================
title 29 Solutions Quick Script v1.15
color 0A
setlocal enabledelayedexpansion

:: ======================================
:: AUTO-ELEVATE TO ADMIN
:: ======================================
:ADMIN_CHECK
net session >nul 2>&1
if %errorlevel% neq 0 (
    @REM echo Membutuhkan hak Administrator. Membuka ulang dengan elevation...
    @REM echo Jika ditampilkan prompt UAC, pilih YES untuk run sebagai Administrator.
    @REM echo.
    @REM echo Jika memilih NO, aplikasi akan tetap berjalan dengan fitur terbatas.
    @REM echo.
    @REM pause
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs" >nul 2>&1
    if errorlevel 1 (
        echo.
        echo Anda memilih untuk TIDAK run sebagai Administrator.
        echo Beberapa fitur mungkin tidak tersedia.
        timeout /t 3 >nul
        goto LOGIN_ADV
    ) else (
        exit /b
    )
)

@REM :: ======================================
@REM :: SIMPLE ACCESS CODE LOGIN
@REM :: ======================================
@REM :LOGIN_ADV
@REM cls
@REM echo.
@REM echo            ==========================================
@REM echo            I      29 SOLUTIONS QUICK SCRIPT        I
@REM echo            I                v1.15                  I
@REM echo            ==========================================
@REM echo.
@REM echo                   [ AUTHENTICATION REQUIRED ]
@REM echo.
@REM echo.

@REM :: Use PowerShell for secure password input
@REM set "access_code="
@REM echo                       Enter Access Code
@REM for /f "delims=" %%i in ('powershell -Command "$password = Read-Host -AsSecureString ('                      '); $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)" 2^>nul') do set "access_code=%%i"

@REM if "%access_code%"=="" (
@REM     echo.
@REM     echo ERROR: Access code tidak boleh kosong!
@REM     timeout /t 2 >nul
@REM     goto LOGIN_ADV
@REM )

@REM if "%access_code%"=="ketauaneuy" (
@REM     echo.
@REM     echo                     [Access Code Verified]
@REM     set "LOGIN_STATUS=SUCCESS"
@REM     timeout /t 1 >nul
@REM     goto MAIN_MENU
@REM ) else (
@REM     echo.
@REM     echo                     ERROR: Access code salah!
@REM     timeout /t 2 >nul
@REM     goto LOGIN_ADV
@REM )

:: ======================================
:: MAIN MENU - ENHANCED
:: ======================================
:MAIN_MENU
cls
echo =====================================
echo    29 Solutions Quick Script v1.15
echo =====================================
echo.
echo === Technician Menu ===
echo 1. Power Options                [Ready]
echo 2. System and Hardware Tools    [Development]
echo 3. Maintenance                  [Quick Light Cleaning]
echo 4. Admin Tools                  [Development]
echo 5. View Activity Log            [CURRENTLY DISABLED]
echo.
echo === Technical Menu ===
echo 6. Network Tools		[Development]
echo 7. Developer Tools              [Development]
echo 8. Remote Support Tools         [Development]
echo 9. Security Hardening           [Development]
echo 10. Performance Monitor         [Development]
echo.
echo === Advanced Menu ===
echo 11. Backup and Recovery           [Development]
echo 12. Cloud and API Tools           [Development]
echo 13. Automated Diagnostics         [Development]
echo 14. Configuration Manager         [Development]
echo.
echo ?. Info and Statistics
echo q. Quit Session
echo x. Exit Script
echo.
set /p menu="Pilih menu (1-14): "

if "%menu%"=="1" goto POWER_MENU
if "%menu%"=="2" goto SYSTEM_MENU
if "%menu%"=="3" goto MAINTENANCE_MENU
if "%menu%"=="4" goto ADMIN_MENU
if "%menu%"=="5" goto VIEW_LOGS_MENU
if "%menu%"=="6" goto NETWORK_MENU
if "%menu%"=="7" goto DEVTOOLS_MENU
if "%menu%"=="8" goto REMOTE_MENU
if "%menu%"=="9" goto SECURITY_MENU
if "%menu%"=="10" goto PERF_MONITOR
if "%menu%"=="11" goto BACKUP_MENU
if "%menu%"=="12" goto CLOUD_MENU
if "%menu%"=="13" goto DIAGNOSTICS_MENU
if "%menu%"=="14" goto CONFIG_MENU
if "%menu%"=="x" goto EXIT
if "%menu%"=="?" goto INFO_STATS
if /i "%menu%"=="q" goto LOGOUT
goto MAIN_MENU

:: ======================================
:: EXIT SESSION FUNCTION
:: ======================================
:LOGOUT
set "LOGIN_STATUS="
echo.
echo Exit Current Session
timeout /t 2 >nul
goto LOGIN_ADV

:: ======================================
:: POWER OPTIONS (DENGAN ERROR HANDLING)
:: ======================================
:POWER_MENU
cls
echo === Power Options ===
echo 1. Sleep
echo 2. Shutdown
echo 3. Force Shutdown
echo 4. Restart
echo 5. Safe Mode Restart
echo x. Back
set /p p="Pilih (1-6): "

if "%p%"=="1" call :CONFIRM_SLEEP
if "%p%"=="2" call :CONFIRM_SHUTDOWN
if "%p%"=="3" call :CONFIRM_FORCE_SHUTDOWN
if "%p%"=="4" call :CONFIRM_RESTART
if "%p%"=="5" call :CONFIRM_SAFE_MODE_RESTART
if "%p%"=="x" goto MAIN_MENU
goto POWER_MENU

:CONFIRM_SLEEP
echo.
set /p confirm="Yakin ingin sleep komputer? (y/n): "
if /i "%confirm%"=="y" (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)"
) else (
    echo Sleep dibatalkan.
)
goto POWER_MENU

:CONFIRM_SHUTDOWN
echo.
set /p confirm="Yakin ingin shutdown komputer? (y/n): "
if /i "%confirm%"=="y" (
    shutdown /s /t 5 /c "Shutdown oleh 29 Solutions Quick Script"
    echo Komputer akan shutdown dalam 5 detik...
) else (
    echo Shutdown dibatalkan.
)
goto POWER_MENU

:CONFIRM_FORCE_SHUTDOWN
echo.
set /p confirm="Yakin ingin FORCE shutdown komputer? (y/n): "
if /i "%confirm%"=="y" (
    shutdown /s /f /t 3 /c "Force shutdown oleh 29 Solutions Quick Script"
    echo Komputer akan force shutdown dalam 3 detik...
) else (
    echo Force shutdown dibatalkan.
)
goto POWER_MENU

:CONFIRM_RESTART
echo.
set /p confirm="Yakin ingin restart komputer? (y/n): "
if /i "%confirm%"=="y" (
    shutdown /r /t 5 /c "Restart oleh 29 Solutions Quick Script"
    echo Komputer akan restart dalam 5 detik...
) else (
    echo Restart dibatalkan.
)
goto POWER_MENU

:CONFIRM_SAFE_MODE_RESTART
echo.
set /p confirm="Yakin ingin restart ke Safe Mode? (y/n): "
if /i "%confirm%"=="y" (
    bcdedit /set {default} safeboot minimal >nul 2>&1
    if %errorlevel% equ 0 (
        shutdown /r /t 5 /c "Restart ke Safe Mode oleh 29 Solutions Quick Script"
        echo Komputer akan restart ke Safe Mode dalam 5 detik...
    ) else (
        echo Gagal mengatur Safe Mode. Perlu run sebagai Administrator.
    )
) else (
    echo Safe Mode restart dibatalkan.
)
goto POWER_MENU

:: ======================================
:: SYSTEM AND HARDWARE TOOLS (DENGAN ERROR HANDLING)
:: ======================================
:SYSTEM_MENU
cls
echo === System and Hardware Tools ===
echo 1. Info Sistem Lengkap
echo 2. Cek Kondisi Storage
echo 3. Lihat Status Driver
echo 4. Cek Suhu CPU
echo 5. Export System Report
echo 6. System Health Check        [NEW]
echo 7. Event Log Analyzer         [NEW]
echo 8. Hardware Diagnostics       [NEW]
echo x. Back
set /p s="Pilih (1-9): "

if "%s%"=="1" (
    cls
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" 2>nul || echo Informasi sistem tidak tersedia
    echo.
    wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors 2>nul || echo Informasi CPU tidak tersedia
    echo.
    wmic path win32_videocontroller get name 2>nul || echo Informasi GPU tidak tersedia
    echo.
    pause
)
if "%s%"=="2" (
    wmic logicaldisk get name,description,filesystem,freespace,size 2>nul || echo Informasi disk tidak tersedia
    pause
)
if "%s%"=="3" (
    driverquery /v | more 2>nul || echo Informasi driver tidak tersedia
)
if "%s%"=="4" (
    wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature 2>nul || echo Informasi suhu tidak tersedia
)
if "%s%"=="5" (
    systeminfo > "system_report.txt" 2>nul && (
        echo Laporan sistem tersimpan di "system_report.txt"
    ) || (
        echo Gagal menyimpan laporan sistem
    )
)
if "%s%"=="6" call :SYSTEM_HEALTH_CHECK
if "%s%"=="7" call :EVENT_LOG_ANALYZER
if "%s%"=="8" call :HARDWARE_DIAGNOSTICS
if "%s%"=="x" goto MAIN_MENU
pause
goto SYSTEM_MENU

:: ======================================
:: MAINTENANCE (DENGAN ERROR HANDLING)
:: ======================================
:MAINTENANCE_MENU
cls
echo === Maintenance ===
echo 1. Bersihkan File Sementara
echo 2. Jalankan SFC Scan
echo 3. Jalankan DISM Restore
echo 4. Buat Restore Point
echo 5. Run All Maintenance (Quick)      [NEW]
echo 6. Run All Maintenance (Comprehensive) [NEW]
echo 7. Schedule Maintenance             [NEW]
echo 8. Maintenance Report               [NEW]
echo x. Back
set /p m="Pilih (1-9): "

if "%m%"=="1" call :CLEAN_TEMP_FILES
if "%m%"=="2" call :RUN_SFC_SCAN
if "%m%"=="3" call :RUN_DISM_RESTORE
if "%m%"=="4" call :CREATE_RESTORE_POINT
if "%m%"=="5" call :RUN_QUICK_MAINTENANCE
if "%m%"=="6" call :RUN_COMPREHENSIVE_MAINTENANCE
if "%m%"=="7" call :SCHEDULE_MAINTENANCE
if "%m%"=="8" call :GENERATE_MAINTENANCE_REPORT
if "%m%"=="x" goto MAIN_MENU
pause
goto MAINTENANCE_MENU

:CLEAN_TEMP_FILES
echo Membersihkan file temporary...
del /s /q "%TEMP%\*" 2>nul
del /s /q "C:\Windows\Temp\*" 2>nul
echo ✓ File temporary dibersihkan
goto :EOF

:RUN_SFC_SCAN
echo Menjalankan SFC scannow...
sfc /scannow
goto :EOF

:RUN_DISM_RESTORE
echo Menjalankan DISM restore health...
dism /online /cleanup-image /restorehealth
goto :EOF

:CREATE_RESTORE_POINT
echo Membuat restore point...
powershell -Command "Checkpoint-Computer -Description '29Solutions_Manual_RestorePoint'" 2>nul && (
    echo ✓ Restore point berhasil dibuat
) || (
    echo ✗ Gagal membuat restore point
)
goto :EOF

:: ======================================
:: SYSTEM HEALTH CHECK DENGAN ERROR HANDLING
:: ======================================
:SYSTEM_HEALTH_CHECK
cls
echo [%date% %time%] Running Comprehensive System Health Check...
echo.

echo === MEMORY STATUS ===
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /value 2>nul || echo "Memory information not available"
echo.

echo === STORAGE HEALTH ===
wmic diskdrive get status,size,model 2>nul || echo "Storage information not available"
echo.

echo === CPU USAGE ===
wmic cpu get loadpercentage 2>nul || echo "CPU information not available"
echo.

echo === BATTERY STATUS ===
wmic path Win32_Battery get EstimatedChargeRemaining,Status 2>nul || echo "No battery detected or information not available"
echo.

echo === EVENT LOG ERRORS (Last 24h) ===
powershell "Get-EventLog -LogName System -EntryType Error -After (Get-Date).AddHours(-24) | Select-Object -First 5 TimeGenerated,Source,Message" 2>nul || echo "Event log access requires elevation or not available"
echo.

echo ✓ System health check completed!
pause
goto SYSTEM_MENU

:: ======================================
:: COMPREHENSIVE MAINTENANCE DENGAN ERROR HANDLING
:: ======================================
:RUN_COMPREHENSIVE_MAINTENANCE
cls
echo [1/8] Cleaning temp files...
del /s /q "%TEMP%\*" 2>nul
del /s /q "C:\Windows\Temp\*" 2>nul
echo ✓ Temp files cleaned

echo [2/8] Running DISM restore health...
dism /online /cleanup-image /restorehealth 2>nul && echo ✓ DISM completed || echo ✗ DISM failed

echo [3/8] Running SFC scannow...
sfc /scannow 2>nul && echo ✓ SFC completed || echo ✗ SFC failed

echo [4/8] Cleaning DNS cache...
ipconfig /flushdns 2>nul && echo ✓ DNS cache flushed || echo ✗ DNS flush failed

echo [5/8] Defragmenting analysis...
powershell "Optimize-Volume -DriveLetter C -Analyze -Verbose" 2>nul && echo ✓ Disk analysis completed || echo ✗ Disk analysis failed

echo [6/8] Checking disk health...
chkdsk C: /scan 2>nul && echo ✓ Disk health checked || echo ✗ Disk check failed

echo [7/8] Updating Windows Defender...
powershell "Update-MpSignature" 2>nul && echo ✓ Defender updated || echo ✗ Defender update failed

echo [8/8] Cleaning recycle bin...
powershell "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" 2>nul && echo ✓ Recycle bin cleared || echo ✗ Recycle bin clear failed

echo.
echo ✓ Comprehensive maintenance completed!
pause
goto MAINTENANCE_MENU

:: ======================================
:: PORT SCANNER DENGAN ERROR HANDLING
:: ======================================
:PORT_SCANNER
cls
set "target="
set /p "target=Target IP/Hostname: "
set "ports="
set /p "ports=Ports (ex: 80,443,3389,21,22): "

if "%target%"=="" (
    echo ERROR: Target tidak boleh kosong!
    pause
    goto NETWORK_MENU
)

if "%ports%"=="" (
    echo ERROR: Ports tidak boleh kosong!
    pause
    goto NETWORK_MENU
)

echo Scanning %target% for ports %ports%...
echo.

for %%p in (%ports%) do (
    echo Checking port %%p...
    powershell "Test-NetConnection -ComputerName '%target%' -Port %%p -WarningAction SilentlyContinue -ErrorAction SilentlyContinue" | findstr "TcpTestSucceeded" >nul 2>&1
    if !errorlevel! equ 0 (
        echo ✓ Port %%p: OPEN
    ) else (
        echo ✗ Port %%p: CLOSED
    )
)

echo.
echo ✓ Port scan completed!
pause
goto NETWORK_MENU

:: ======================================
:: INFO AND STATISTICS [ENHANCED]
:: ======================================
:INFO_STATS
cls
echo === INFORMATION AND STATISTICS ===
echo.
echo Tool Version: 29 Solutions Quick Script v1.15
echo User: %USERNAME%
echo Computer: %COMPUTERNAME%
echo Running as: Administrator
echo.
echo === TROUBLESHOOTING TIPS ===
echo 1. Always run as Administrator for full functionality
echo 2. Some features may require Windows 10/11
echo 3. Logging features are currently disabled
echo.
pause
goto MAIN_MENU

:: ======================================
:: VIEW LOGS MENU DENGAN ERROR HANDLING
:: ======================================
:VIEW_LOGS_MENU
cls
echo === View Activity Log ===
echo.
echo Fitur logging saat ini dinonaktifkan.
echo.
pause
goto MAIN_MENU

:: ======================================
:: PLACEHOLDER FUNCTIONS
:: ======================================
:RUN_QUICK_MAINTENANCE
echo Quick maintenance feature - implement later
pause
goto MAINTENANCE_MENU

:SCHEDULE_MAINTENANCE
echo Schedule maintenance feature - implement later
pause
goto MAINTENANCE_MENU

:GENERATE_MAINTENANCE_REPORT
echo Maintenance report feature - implement later
pause
goto MAINTENANCE_MENU

:EVENT_LOG_ANALYZER
echo Event log analyzer feature - implement later
pause
goto SYSTEM_MENU

:HARDWARE_DIAGNOSTICS
echo Hardware diagnostics feature - implement later
pause
goto SYSTEM_MENU

:: ======================================
:: EXIT SCRIPT
:: ======================================
:EXIT
@REM cls
@REM echo.
@REM echo Ciao %USERNAME%
@REM timeout /t 2 >nul
exit