#!/bin/bash
# Start the XFCE desktop on TigerVNC and expose it via noVNC (port 6080).
# Portrait display: 540x960.
set -e

export DISPLAY=:1

mkdir -p "$HOME/.vnc"
# VNC password for browser access
printf '%s' "vscode" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

# Restart the VNC server if it is already running
vncserver -kill :1 >/dev/null 2>&1 || true

# TigerVNC server with XFCE, portrait 540x960
vncserver :1 \
  -geometry 540x960 \
  -depth 24 \
  -localhost no \
  -SecurityTypes VncAuth \
  -xstartup /usr/bin/startxfce4

# noVNC web client on port 6080 -> VNC display :1 (port 5901)
nohup websockify --web=/usr/share/novnc 6080 localhost:5901 >/tmp/novnc.log 2>&1 &

echo "Desktop running: VNC on 5901, noVNC on http://localhost:6080/vnc.html"
