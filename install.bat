@echo off
setlocal enabledelayedexpansion

REM Konfiguration (%cd% = aktuelles Verzeichnis)
set "source=%cd%"
set "target=%userprofile%\Documents\My Games\Path of Exile 2"

REM File mit den zu verlinkenden Filter-Dateien
set "filterlist=filterlist.txt"

echo Installationsmodus aktiviert. Erstelle Links...

REM Sicherstellen, dass das Zielverzeichnis existiert
if not exist "%target%" (
    mkdir "%target%"
)

REM Dateien aus der Liste durchgehen und Links erstellen
for /f "usebackq delims=" %%f in ("%filterlist%") do (
    set "sourceFile=%source%\%%f"
    set "targetFile=%target%\%%f"

    if exist "!sourceFile!" (        
        if not exist "!targetFile!" (            
            mklink /H "!targetFile!" "!sourceFile!"
            echo Link erstellt: "!targetFile!" -^> "!sourceFile!"
        ) else (
            echo Ziel existiert bereits: "!targetFile!"
        )
    ) else (
        echo Quelle fehlt: "!sourceFile!"
    )
)

echo Installation abgeschlossen.
timeout /t 3