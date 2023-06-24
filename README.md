# o0otools
Various on Linux Mint 21 Cinnamon only tested bash shell code snippets for use in ~/.bashrc or for execution in a bash shell session. 
See comments in the file(s) for details (required packages and explanation of used code). Adapt the provided code to your own requirements and adjust it if necessary to run on your specific kind of system. I use it myself and enjoy it as it is, so maybe it can be also useful for you. 

Notice that o0otools prefer to use the `/A/o/` directory and subdirectories, so you will probably need to adjust the hard-wired paths in the scripts if you don't want to use the concept of having as short paths as possible storing all of the custom content in a directory which is at the top of the list in the file browser. 

Anoter principle guiding the basic concept behind these tools is to provide commands which don't take any arguments and options. These commands assume the existence of appropriate environment variables with to them assigned right values. So usually you will neet to set some values first (if not previously already set to the required values) and then just run the command. 

#### FULLSCREEN viewing of COLORS

The basic idea is to make viewing any possible color without disturbing the color impression by existance of any other colors on the screen from the Terminal shell command line prompt. Provided are following aliases and functions for selecting/picking a color and/or showing a previously
by e.g.  color=#FFFF00  or  color=rgb(255,255,0)  defined color FULLSCREEN.

  sh-bash-lang_howTo_showDefinedSelectedPickedColor-FULLSCREEN.sh:

**pickcolor**   : *get color interactively from screen pixel* ::
**selectcolor** : *select color using color selection dialog* ::
**showcolor**   : *available in  color  env. variable FULLSCREEN* ::
**pickselshow** : *select (or pick aborting selection) the color to show it finally FULLSCREEN*
