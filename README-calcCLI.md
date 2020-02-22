# calcCLI
calcCLI is an easy calculator for the command line.
## Installation
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

Next open the calcCLI.sh file:
```
nano calcCLI.sh
```
In the first line, you need to specify the path to bash. This various from system to sytem. So replace it with the first result, you got from th first command. Save with Ctrl+o, press Enter and Exit with Ctrl+x

## Usage
To use calcCLI you just type the path to the `.sh` file, the first number, your calculation methode and your second number into your shell of choise. eg:
```
$ ./calcCLI.sh 1+1
2
$ ./calcCLI.sh 5-5
0
```
Hear is a list of all methodes:
```
+    -> plus
-    -> minus
*    -> times
/    -> divid by
**   -> multiply
```
