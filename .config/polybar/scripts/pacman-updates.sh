#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg
STATE_FILE=/tmp/polybar-pacman-updates-last

UPDATES=$(checkupdates 2>/dev/null | wc -l)

# saída para Polybar
if (( UPDATES > 0 )); then
    echo "$UPDATES"
else
    echo "0"
fi

# lê último valor salvo
LAST_UPDATES=0
[[ -f "$STATE_FILE" ]] && LAST_UPDATES=$(cat "$STATE_FILE")

# só notifica se o número mudou
if (( UPDATES != LAST_UPDATES )); then
    echo "$UPDATES" > "$STATE_FILE"
    if (( UPDATES > 0 )); then
        if (( UPDATES > 50 )); then
            notify-send -u critical -i "$NOTIFY_ICON" \
                "Atualizações críticas disponíveis" "$UPDATES atualizações pendentes"
        elif (( UPDATES > 25 )); then
            notify-send -u normal -i "$NOTIFY_ICON" \
                "Atualizações recomendadas" "$UPDATES atualizações pendentes"
        else
            notify-send -u low -i "$NOTIFY_ICON" \
                "$UPDATES atualizações disponíveis"
        fi
    fi
fi
