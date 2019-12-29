#!/bin/bash
ROOT="$(readlink -f $(dirname "$0"))" COLORDIR=$ROOT/"$1" 
DARK=true

print_usage() {
	echo "Usage: $0 [options]"

	echo
	echo "Options:"
	echo " -l Lieght theme"
	echo " -d Dark theme"

	exit 1
}

while [[ $# > 0 ]]
		do
		case ${1} in
			-h)
				print_usage
                        ;;
			-l)
				#echo "skip termite $#"
				DARK="false"
			;;
			-d)
				#echo "skip elokab $#"
			        Dark="true"

			;;
		esac
    shift 
done

#-------------------------------------------------------------------------------------------------------------------
function set_config(){
     sed -i "s/^\($1\s*=\s*\).*\$/\1$2/" "$3"
}

#-------------------------------------------------------------------------------------------------------------------
 function set_xconfig(){ 
      sed -i "s/^\($1\s*:\s*\).*\$/\1$2/" "$3"
 }

#-------------------------------------------------------------------------------------------------------------------

COLORBG=$( xrdb -query | egrep -m1 "^\*\.?background:" | cut -d ":" -f 2-)
echo "[+] background =" $XCOLORBG

COLORFG=$( xrdb -query | egrep -m1 "^\*\.?foreground:" | cut -d ":" -f 2-) 
echo "[+] foreground =" $XCOLORFG


if [ "$DARK" == "false" ]; then
 echo "light thrme"
 XCOLORFG=#1A1E21
 XCOLORBG=#D0D0D0
 THEMNAME="Arc"
 ICONNAME="Papirus"
else
   echo "dark theme"
  XCOLORBG=#1A1E21
  XCOLORFG=#898B8B
  THEMNAME="Sweet-mars"
  ICONNAME="Papirus-Dark"
fi



        ELOKABFILE="$HOME/.config/elokab/elokab-terminal.conf"


	echo "[+] copy elokab-terminal.conf elokab-terminal.conf-back"
	cp $ELOKABFILE "$HOME/.config/elokab/elokab-terminal.conf-back"


	 set_config "background" $XCOLORBG "$ELOKABFILE"
	 set_config "foreground" $XCOLORFG "$ELOKABFILE"

        XRES=$HOME/.Xresources

        echo "[+] creating Xresource backup"
	cp $HOME/.Xresources $HOME/.Xresources-back

         set_xconfig "*.background" $XCOLORBG "$XRES"
         set_xconfig "*.foreground" $XCOLORFG "$XRES"


         echo "[+] creating backub files....gtkrc-2.0-back settings.ini-back qt5ct.conf-back"
	 cp "$HOME/.gtkrc-2.0" "$HOME/.gtkrc-2.0-back"
	 cp "$HOME/.config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini-back"

        echo  "[+] $HOME/.gtkrc-2.0"
         set_config "gtk-theme-name"  "\"$THEMNAME\""  "$HOME/.gtkrc-2.0"
        set_config "gtk-icon-theme-name"  "\"$ICONNAME\""  "$HOME/.gtkrc-2.0"

        echo "[+] $HOME/.config/gtk-3.0/settings.ini"
	set_config "gtk-theme-name" $THEMNAME "$HOME/.config/gtk-3.0/settings.ini"
        set_config "gtk-icon-theme-name"  $ICONNAME  "$HOME/.config/gtk-3.0/settings.ini"




xrdb ~/.Xresources

elokab-terminal -r

qobbar -c greenbar -R

i3 reload
