# CHAPT
CHAPT is a universal front end to package mangers like yay, snap, flatpak, apt, dnf, zypper, pacman, emerge and yum.

## Installation and Start
First make sure, you have `bash` installed on your system.

```
whereis bash                                         
```
You should get results simular to this one:
```
  bash: /usr/bin/bash /usr/lib/bash /etc/bash.bashrc /etc/bash.bash_logout /usr/include/bash /usr/share/man/man1/bash.1.gz /usr/share/info/bash.info.gz
```
if you just get somethig like this:
```
bash:
```
 you must install `bash` first.

Next open the CHAPT.sh file:
```
nano CHAPT.sh
```
In the first line, you need to specify the path to bash. This various from system to sytem. So replace it with the first result, you got from th first command. Save with Ctrl+o, press Enter and Exit with Ctrl+x

To start CHAPT use:
```
./CHAPT.sh
```
in your shell of choice.
## Usage
To get the intigrated help type `m` or `help` and press `Enter`:

    S/install             install a package
    Ss/search             search for a package
    R/remove              remove a package
    E/exit                exit this programm
    M/help                see this text message
    Syu/update            update the system
    Qs/localesearch       search for packages on your system
    Q/package             display all installed packeges with version

    You may need to give a Package name and enter a methode (apt, flatpak, snap, yay, dnf, zypper, eopkg, emerge or yum)
