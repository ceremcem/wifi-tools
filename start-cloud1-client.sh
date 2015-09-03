#!/bin/bash 

cd /home/ceremcem

export USER="ceremcem"
export USERNAME=ceremcem 
export MAIL=/var/mail/ceremcem 
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin 
export HOME=/home/ceremcem 
export LOGNAME=ceremcem 

XDG_VTNR=7
SSH_AGENT_PID=4506
XDG_SESSION_ID=1
COMP_WORDBREAKS= 	
"'><;|&(:
GPG_AGENT_INFO=/tmp/gpg-SrtlDK/S.gpg-agent:4526:1
GLADE_PIXMAP_PATH=:
TERM=xterm
SHELL=/bin/bash
XDG_MENU_PREFIX=xfce-
XDG_SESSION_COOKIE=44bb9b8e6b8e1e1a8b21ba9f5352fa2b-1420734478.799900-502972028
USER=ceremcem
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
XDG_SESSION_PATH=/org/freedesktop/DisplayManager/Session0
GLADE_MODULE_PATH=:
XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
SSH_AUTH_SOCK=/tmp/ssh-YqdyXIW0AqfD/agent.4477
SESSION_MANAGER=local/cca-erik:@/tmp/.ICE-unix/4520,unix/cca-erik:/tmp/.ICE-unix/4520
XDG_CONFIG_DIRS=/etc/xdg
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/home/ceremcem/bin:/home/ceremcem/bin/stlink.git:/home/ceremcem/bin/gcc-arm-none-eabi-4_8-2014q1/bin:/home/ceremcem/node_modules/.bin
DESKTOP_SESSION=xfce
PWD=/home/ceremcem
LANG=en_US.utf8
GDMSESSION=xfce
SHLVL=1
XDG_SEAT=seat0
HOME=/home/ceremcem
LANGUAGE=en_US:en
LOGNAME=ceremcem
XDG_DATA_DIRS=/usr/share/xfce4:/usr/local/share/:/usr/share/:/usr/share
DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-1h4d75nDvS,guid=2c966d610fc14c1ac47c222654aeb00f
XDG_RUNTIME_DIR=/run/user/1000
DISPLAY=:0.0
GLADE_CATALOG_PATH=:
XAUTHORITY=/home/ceremcem/.Xauthority
_=/usr/bin/env



echo $(env) 

if [[ "$(pidof seafile-applet)" == "" ]]; then 
	echo "seafile-applet not started, starting..."
	/usr/bin/seafile-applet -
else
	echo "seafile-applet seems to be started already..."
fi 