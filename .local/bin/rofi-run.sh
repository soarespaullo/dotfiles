#!/bin/bash
cmd="$1"
if command -v "$cmd" >/dev/null 2>&1; then
    exec "$cmd"
else
    notify-send -i dialog-error "Rofi" "Comando '$cmd' não encontrado"
    exit 1
fi
