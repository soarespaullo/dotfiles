#!/usr/bin/env sh

# Encerrar instâncias de bar já em execução.
killall -q polybar

# Espere até que os processos sejam encerrados.
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Barra de lançamento top e barra bottom.

polybar -q top &
polybar -q bottom &

echo "Barras lançadas ..."