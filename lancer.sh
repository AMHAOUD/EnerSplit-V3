#!/usr/bin/env bash
# EnerSplit - lancement sous macOS / Linux :  ./lancer.sh
set -e
cd "$(dirname "$0")"
if [ ! -x .venv/bin/python ]; then
  echo "Première installation : création de l'environnement Python…"
  python3 -m venv .venv
  .venv/bin/python -m pip install --upgrade pip
  .venv/bin/python -m pip install -r requirements.txt
fi
exec .venv/bin/python backend/serveur.py "$@"
