[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.fehbg ] && ~/.fehbg

xcompmgr &
unclutter &
dwmblocks &
exec dwm
