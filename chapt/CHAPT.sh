#!/bin/sh
# CHAPT 2.7 YAY/SNAP/FLATPAK/APT/DNF/ZYPPER/EMERGE/YUM/PACMAN

PACKEGE=""
EXIT="false"
function pacageAsker(){
	read -p "What Package are you talking about? " PACKEGE
}
function helpText(){
	echo "	  S/install		install a package"
	echo "	  Ss/search		search for a package"
	echo "	  R/remove 		remove a package"
	echo "	  E/exit  		exit this programm"
	echo "	  M/help		see this text message"
	echo "	  Syu/update		update the system"
	echo "	  Qs/localesearch       search for packages on your system"
	echo "	  Q/package		display all installed packeges with version"
	echo "	  "
	echo "	  You may need to give a Package name and enter a methode (apt, flatpak, snap, yay, dnf, zypper, emerge, eopkg, yum or pacman)."
}
function jobset(){
	read -p "What do you want to do? " JOBINPUT
}
function mehtode() {
	read -p "What methode do you want to use? " METHODEINTERNAL
	case $METHODEINTERNAL in
		[yY]|[yY][aA][yY]|[aA][uU][rR])
			METHODE="yay"
			;;
		[Ss]|[sS][nN][aA][pP])
			METHODE="snap"
			;;
		[fF]|[fF][lL][aA][tT][pP][aA][kK])
			METHODE="flatpak"
			;;
		[aA]|[aA][pP][tT])
			METHODE="apt"
			;;
		[dD]|[dD][nN][fF])
			METHODE="dnf"
			;;
		[zZ]|[zZ][yY][pP][pP][eE][rR])
			METHODE="zypper"
			;;
		[eE]|[eE][mM][eE][rR][gG][eE])
			METHODE="emerge"
			;;
		[yY][uU][mM])
			METHODE="yum"
			;;
		[pP]|[pP][aA][cC][mM][aA][nN])
			METHODE="pacman"
			;;
		[eE][oO]|[eE][Oo][Pp][Kk][Gg])
			METHODE="eopkg"
			;;
		*)
			if [[ $(whereis yay) != "yay:" ]]; then 
				METHODE="yay"
			elif [[ $(whereis pacman) != "pacman:" ]]; then 
				METHODE="pacman"
			elif [[ $(whereis apt) != "apt:" ]]; then 
				METHODE="apt"
			elif [[ $(whereis dnf) != "dnf:" ]]; then 
				METHODE="dnf"
			elif [[ $(whereis zypper) != "zypper:" ]]; then 
				METHODE="zypper"
			elif [[ $(whereis emerge) != "emerge:" ]]; then 
				METHODE="emerge"
			elif [[ $(whereis yum) != "yum:" ]]; then 
				METHODE="yum"
			elif [[ $(whereis eopkg) != "eopkg:" ]]; then 
				METHODE="eopkg"
			fi
			;;
	esac
}
function main() {
	if [ $METHODE = "yay" ]; then
		yay -$FUNKTION $PACKEGE
	elif [ $METHODE = "pacman" ]; then
		sudo pacman -$FUNKTION $PACKEGE
	elif [ $METHODE = "snap" ]; then
		case $FUNKTION in
			[S])
				sudo snap install $PACKEGE
				;;
			[S][s])
				sudo snap find $PACKEGE
				;;
			[S][y][u])
				sudo snap refresh
				;;
			[R][n][s])
				sudo snap remove
				;;
			Q) 
				snap list
				;;
			*)
					echo "Snap doesn't have the function"
					;;
		esac
	elif [ $METHODE = "flatpak" ]; then
		case $FUNKTION in
			[S])
				sudo flatpak install $PACKEGE
				;;
			[S][s])
				sudo flatpak search $PACKEGE
				;;
			[S][y][u])
				sudo flatpak update
				;;
			[R]n[s])
				sudo flatpak uninstall $PACKEGE
				;;
			[Q])
				sudo flatpak list
				;;
			*)
					echo "Flatpak doesn't have the function"
					;;
		esac
	elif [ $METHODE = "apt" ]; then
		case $FUNKTION in
			[S])
				sudo apt install $PACKEGE
				;;
			[S][s])
				sudo apt search $PACKEGE
				;;
			[S][y][u])
				sudo apt update && sudo apt upgrade
				;;
			[R]n[s])
				sudo apt remove $PACKEGE
				;;
			*)
					echo "Apt doesn't have the function"
					;;
		esac
	elif [ $METHODE = "dnf" ]; then
		case $FUNKTION in
			[S])
				sudo dnf install $PACKEGE
				;;
			[S][s])
				sudo dnf search $PACKEGE
				;;
			[S][y][u])
				sudo dnf upgrade && dnf distro-sync
				;;
			[R]n[s])
				sudo dnf remove $PACKEGE
				;;
			[Q])
				sudo dnf list installed
				;;
			*)
					echo "Dnf doesn't have the function"
					;;
		esac
	elif [ $METHODE = "zypper" ]; then
		case $FUNKTION in
			[S])
				sudo zypper install $PACKEGE
				;;
			[S][s])
				sudo zypper search $PACKEGE
				;;
			[S][y][u])
				sudo zypper update
				;;
			[R]n[s])
				sudo zypper remove $PACKEGE
				;;
			[Q])
				sudo zypper search --installed-only
				;;
			*)
					echo "Zypper doesn't have the function"
					;;
		esac
	elif [ $METHODE = "emerge" ]; then
		case $FUNKTION in
			[S])
				sudo emerge -a $PACKEGE
				;;
			[S][s])
				sudo emerge -S $PACKEGE
				;;
			[S][y][u])
				sudo emerge -uDN @world
				;;
			[R]n[s])
				sudo emerge -vc  $PACKEGE
				;;
			[Q])
				sudo zypper search --installed-only
				;;
			*)
					echo "Zypper doesn't have the function"
					;;
		esac
	elif [ $METHODE = "yum" ]; then
		case $FUNKTION in
			[S])
				sudo yum install $PACKEGE
				;;
			[S][s])
				sudo yum search $PACKEGE
				;;
			[S][y][u])
				sudo yum upgrade && yum distro-sync
				;;
			[R]n[s])
				sudo yum remove $PACKEGE
				;;
			[Q])
				sudo yum list installed
				;;
			*)
					echo "Yum doesn't have the function"
					;;
		esac
	elif [ $METHODE = "eopkg" ]; then
		case $FUNKTION in
			[S])
				sudo eopkg install $PACKEGE
				;;
			[S][s])
				sudo eopkg search $PACKEGE
				;;
			[S][y][u])
				sudo eopkg upgrade
				;;
			[R]n[s])
				sudo eopkg remove $PACKEGE
				;;
			*)
					echo "eopkg doesn't have the function"
					;;
		esac
	else
		echo Your Methode is not suported!
	fi
	echo $(date) $METHODE $FUNKTION $PACKEGE >> ~/.local/CHAPT.log
}
function mema() {
	mehtode
	main
}
jobset
while [ $EXIT == "false" ]; do
	PACKEGE=" "
	case $JOBINPUT in
		[Ss]|[Ii][nN][Ss][tT][aA][lL][Ll])
			pacageAsker
			FUNKTION="S"
			mema
			JOBINPUT="NONE"
			;;

		[Ss][sS]|[sS][eE][aA][rR][cC][hH])
			pacageAsker
			FUNKTION="Ss"
			mema
			JOBINPUT="NONE"
			;;

		[Ss][yY][uU]|[uU][pP][Dd][aA][tT][Ee])

			FUNKTION="Syu"
			mema
			JOBINPUT="NONE"
			;;

		[Rr]|[Rr][Ee][Mm][Oo][Vv][Ee])
			pacageAsker
			FUNKTION="Rns"
			mema
			JOBINPUT="NONE"
			;;

		[Ee]|[Ee][Xx][Ii][Tt])
			EXIT="true"
			JOBINPUT="NONE"
			;;

		[mM]|[Hh]|[hH][Ee][Ll][Pp])
			helpText
			JOBINPUT="NONE"
			;;
		[N][O][N][E])
			jobset
			;;
		[qQ][sS]|[lL][oO][cC][aA][lL][eE][sS][eE][aA][rR][cC][hH])
			pacageAsker
			FUNKTION="Qs"
			METHODE="yay"
			mema
			JOBINPUT="NONE"
			;;
		[Qq]|[pP][aA][cC][kK][eE][gG][eE][S])
			FUNKTION="Q"
			METHODE="yay"
			mema
			JOBINPUT="NONE"
			;;
		*)
			echo Command not found!
			echo use "m" for help
			JOBINPUT="NONE"
			;;
	esac
done
exit 0
