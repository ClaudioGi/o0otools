# o0otools
Various on Linux Mint 21 Cinnamon tested bash shell code snippetes for use in ~/.bashrc or for execution in a bash shell session. 
See comments in the file(s) for details (required packages and explanation of used code).

#### FULLSCREEN viewing of COLORS

The basic idea is to make viewing any possible color without disturbing the color impression by existance of any other colors on the screen from the Terminal shell command line prompt. Provided are following aliases and functions for selecting/picking a color and/or showing a previously
by e.g.  color=#FFFF00  or  color=rgb(255,255,0)  defined color FULLSCREEN.

  sh-bash-lang_howTo_showDefinedSelectedPickedColor-FULLSCREEN.sh:

#####   -  pickcolor   :  get color interactively from screen pixel 
#####   -  selectcolor :  select color using color selection dialog 
#####   -  showcolor   :  available in  color  env. variable FULLSCREEN
#####   -  pickselshow :  select (or pick aborting selection) the color to show it finally FULLSCREEN
