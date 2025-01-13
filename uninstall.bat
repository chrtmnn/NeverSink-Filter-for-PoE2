@echo off
chcp 65001
setlocal enabledelayedexpansion

REM Konfiguration
set "target=%userprofile%\Documents\My Games\Path of Exile 2"
set "filterlist=filterlist.txt"

echo Deinstallationsmodus aktiviert. Entferne Links...

REM Dateien aus der Liste durchgehen und Links löschen
for /f "usebackq delims=" %%f in ("%filterlist%") do (
    set "targetFile=%target%\%%f"
    
    if exist "!targetFile!" (
        echo Lösche Link: "!targetFile!"
        del "!targetFile!" >nul 2>&1
    ) else (
        echo Kein Link gefunden: "!targetFile!"
    )
)

echo Deinstallation abgeschlossen.
timeout /t 5