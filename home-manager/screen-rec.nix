{ pkgs ? import <nixpkgs> {} }:
pkgs.writeShellScriptBin "screen-rec-toggle" ''
PIDFILE=/tmp/wf-recorder-hupr.pid

if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE") 2>/dev/null; then
    # Остановить запись
    kill -INT $(cat "$PIDFILE")
    rm "$PIDFILE"
    notify-send "Запись экрана" "Остановлена"
else
    # Начать запись
    OUT=~/Videos/record-$(date '+%Y-%m-%d_%H-%M-%S').mp4
    wf-recorder -g "$(slurp)" -f "$OUT" &
    echo $! > "$PIDFILE"
    notify-send "Запись экрана" "Начата → $OUT"
fi
''
