@echo off
REM EnerSplit - lancement sous Windows (double-clic)
cd /d "%~dp0"
where python >nul 2>nul || (echo Python introuvable : installez Python 3.10 ou plus depuis https://www.python.org en cochant "Add Python to PATH" & pause & exit /b 1)
if not exist ".venv\Scripts\python.exe" (
  echo Premiere installation : creation de l'environnement Python...
  python -m venv .venv || (pause & exit /b 1)
  ".venv\Scripts\python" -m pip install --upgrade pip
  ".venv\Scripts\python" -m pip install -r requirements.txt || (pause & exit /b 1)
)
".venv\Scripts\python" backend\serveur.py %*
pause
