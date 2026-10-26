#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$(realpath "$0")")"
if [[ $EUID -ne 0 ]]; then
  echo 'Esegui la build con sudo: sudo ./build.sh' >&2
  exit 1
fi
command -v lb >/dev/null || { echo 'Installa live-build: sudo apt install live-build' >&2; exit 1; }
if [[ -e config/bootstrap || -e config/common ]]; then
  echo 'Configurazione già presente; per rigenerarla usa ./reset-config.sh (non distruttivo).' >&2
  exit 1
fi
./auto/config
lb build 2>&1 | tee build.log
printf '\nISO disponibili:\n'
find . -maxdepth 1 -name '*.iso' -printf '%f\n'
