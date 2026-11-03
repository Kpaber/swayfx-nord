if [ "$(tty)" = "/dev/tty1" ]; then
	export PATH="$HOME/.local/bin:$PATH"
	export XDG_CURRENT_DESKTOP=sway
	export XDG_SESSION_TYPE=wayland
	export GDK_BACKEND=wayland,x11,*
	export QT_QPA_PLATFORM="wayland;xcb"
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export MOZ_ENABLE_WAYLAND=1
	export ELECTRON_OZONE_PLATFORM_HINT=auto
	export SDL_VIDEODRIVER=wayland,x11
	export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORMTHEME=gtk3

	#exec sway
	sway -d > ~/.sway.log
	echo ""
	setfont '/usr/share/consolefonts/Uni3-Terminus24x12.psf.gz'
fi
