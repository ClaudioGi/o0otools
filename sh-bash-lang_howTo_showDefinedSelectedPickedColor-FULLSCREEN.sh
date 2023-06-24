#!/bin/bash
# ======================================================================
#                  FULLSCREEN viewing of COLORS
# ----------------------------------------------------------------------
#Aliases and functions for choosing a color and/or showing a previously
# by e.g.  color=#FFFF00  or  color=rgb(255,255,0)  defined color 
# FULLSCREEN. Requirements:  
#   convert(pckg: imagmagick)  feh  gpick  xclip  xdotool  zenity
#    ~ $ apt install imagemagick feh gpick xclip xdotool zenity
# Provided commands: 
#   --  pickcolor   :  get color interactively from screen pixel 
#   --  selectcolor :  select color using color selection dialog 
#   --  showcolor   :  available in  color  env. variable FULLSCREEN
#   --  pickselshow :  select (or pick aborting selection) the color 
#                      to show it finally FULLSCREEN
# All supporting <Escape> for exiting them. 
# To make these commands available without pasting this script into the 
# ~/.bashrc file use the  source  command or the  .  dot prefix : 
#               ~ $ . fullPathShellScriptFileName 
# ----------------------------------------------------------------------
color=#FF0000            # default color
imgpath="/A/o/colors/"   # default path for saving solid color images
required_commands=(
  "convert"     "feh" "gpick" "xclip" "xdotool" "zenity")
required_packages=(
  "imagemagick" "feh" "gpick" "xclip" "xdotool" "zenity") 
missing_commands=()
# Check if required commands are available
for cmd in "${required_commands[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
    #if ! which "$cmd" >/dev/null 2>&1; then
        missing_commands+=("$cmd")
    fi
done
# If any commands are missing, prompt for installation
if [[ ${#missing_commands[@]} -gt 0 ]]; then
    echo "Not available commands:"
    for command in "${missing_commands[@]}"; do
        echo "- $command"
    done
    read -rp "Make them available (install)? (Y/N): " choice
    case $choice in
        [Yy])
            # Install the packages providing the commands: 
            apt install "${required_packages[@]}"
            ;;
        *)
            echo "Skipping installation of required packages."
            ;;
    esac
else
    if [[ -n "$o0odebug" ]]; then
        echo "All required commands are available."
    fi
fi

function selectcolor {
  local colorchoice=$(
                zenity --color-selection --show-palette --color=#0000FF)
  if [[ -n $colorchoice ]]; then
    # Provide the selected color two ways: 
    echo "$colorchoice" | xclip -selection clipboard 
    #  v--  as env-variable and as clipboard --^-- content
    color=$colorchoice  # and set 
    echo " color=$color in clipboard and 'color' env. variable."
    echo "Use  showcolor  to display the color fullscreen."
  else
    echo "selectcolor exit:  run pickcolor"
    pickcolor
  fi
}
function pickcolor {
    # Choose a display/screen pixel by clicking on it with the mouse 
    # in order to provide its color on clipboard and in the  color  
    # environment variable. Requires installed  gpick  and  xclip  .
    # --------------------------------------------------------------    
    echo -n | xclip -selection clipboard # set clipboard to "" 
    #  ^-- provides clean exit on Escape without picking a color
    gpick --pick --single # --single blocks further code execution	
    if [[ $? -eq 0 ]]; then
        local pick=$(xclip -o -selection clipboard)
        if [[ -n $pick ]]; then
            color=$pick
            echo " color=$color in clipboard and 'color' env. variable."
            echo "Use  showcolor  to display the color fullscreen."
        else
            echo "pickcolor: exit"
        fi
    else
        echo "pickcolor: exit"
    fi
}
# Single quotes preserve the literal value of each character within 
# them, so backslashes are not needed for line continuation:
alias showcolor='
    geom=$( xdotool getdisplaygeometry | tr " " "x"); 
    imgfile="${imgpath}${color}_${geom}.png"; 
    if [[ ! -f $imgfile ]]; then 
        convert -size  $geom xc:$color $imgfile; 
    fi; 
    feh --fullscreen --hide-pointer $imgfile
'#saila
# Below the breakdown of the above code: 
#  - get screen/display geometry (e.g. 1920x1080) using xdotool and tr
#  - avoid code repetition by settig the  imgfile  environment variable
#  - test if required image file already exist and if not (!) 
#    - use the  convert  command from the  imagemagick  package  
#      to create and save a solid color image with screen/display size
#  - using  feh  to show the image fullscreen hiding the mouse pointer    
alias pickselshow='selectcolor; showcolor'
o0otools="pickcolor selectcolor showcolor pickselshow  $o0otools"
