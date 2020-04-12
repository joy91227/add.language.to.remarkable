#!/usr/bin/env bash
askForIp () {
  echo "please specify your device IP address"
  read IP
  echo "input address is $IP, press 1 to continue, 0 to re-input"
  read IS_CORRECT
  if [ $IS_CORRECT -eq 1 ]
  then
    USER_AT_HOST="root@$IP"
    SSH_SOCKET=~/".ssh/$USER_AT_HOST"
    echo "loading font file to ReMarkable at $IP, you will be asked for the password on your ReMarkable device."
  else
    askForIP
  fi
}

askForIp
ssh -M -f -N -o ControlPath="$SSH_SOCKET" "$USER_AT_HOST"
scp -o ControlPath="$SSH_SOCKET" -pr ./fonts/. "$USER_AT_HOST":/usr/share/fonts/opentype/
echo "finished loading font file to ReMarkable"
ssh -o ControlPath="$SSH_SOCKET" "$USER_AT_HOST" 'echo "refreshing font cache"; fc-cache -f -v; echo "font cache refresh finished."'
echo "Reboot your ReMarkable for changes to take effect. After reboot, select a book in the device and set the font to Noto Serif or to match the font file you loaded"
ssh -S "$SSH_SOCKET" -O exit "$USER_AT_HOST"
