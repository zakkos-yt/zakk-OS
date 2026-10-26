#!/usr/bin/env bash
set -Eeuo pipefail

cd "$(dirname "$(realpath "$0")")"

if [[ $EUID -ne 0 ]]; then
    echo "Esegui con sudo: sudo ./reset-config.sh" >&2
    exit 1
fi

echo "Pulizia delle precedenti compilazioni live-build..."
lb clean

echo "Rimozione della configurazione generata..."
rm -f config/bootstrap config/chroot config/common config/binary config/source

echo "Reset completato. Personalizzazioni e cache preservate."
