#!/bin/bash

echo "[+] Starting SSH server..."
/usr/sbin/sshd

echo "[+] Starting Shellinabox web terminal on port 4200..."
shellinaboxd --no-beep -t -p 4200

echo "[✓] Services running. You can now SSH or open Shellinabox."
tail -f /dev/null
