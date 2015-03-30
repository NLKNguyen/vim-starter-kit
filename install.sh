#!/bin/bash
#===================================================================
#
#          FILE:  install.sh
# 
#         USAGE:  ./install.sh [command] [optional argument]
#
#       The [command] can be one of the following:
#     
#       --save <package name> 
#       saves/backups your ~/.vimrc and ~/.vim/ to a <package name>
#     
#       --load <package name> 
#       loads/restores your ~/.vimrc and ~/.vim/ from the <package name>
#     
#       --list 
#       lists all packages in the pkgs/ of this program directory
#     
#       --remove <package name> 
#       removes the package named <package name>
#     
#       --clean 
#       deletes the current ~/.vimrc and ~/.vim/
#
#       [Optional Flag]
#       -s
#       uses sudo in some subroutines of certain tasks (eg: --load --clean --remove);
#       place at the last argument
#
#   DESCRIPTION: Vim Kit Installer is a simple package manager that simply 
#                backups and restores your .vimrc file and .vim/ directory, 
#                and it can work offline.
#
#  REQUIREMENTS: Unix/Linux
#
#   ENVIRONMENT:  GNU bash, version 4+
# 
#        AUTHOR:  Nguyen Nguyen, NLKNguyen@MSN.com 
#        ORIGIN:  https://github.com/NLKNguyen/vim-kit-installer.git
#       LICENSE:  MIT
#       VERSION:  0.1.2
#
#===================================================================

# Exit code convention:
# 0: success
# 1: error on validating inputs
# 2: error on running save request
# 3: error on running load request
# 4: error on running remove request
# 5: error on running clean request


vimrc_location=~/.vimrc
vim_location=~/.vim/

installer_location=$(pwd)
packages_location="$installer_location/pkgs"

with_sudo=false

# Exit with error code and message
# @Params [Error Code number] [Error Message string]
exitErrMsg () {
  echo -e "$2" # Error Message
  echo "Exit code $1"
  exit $1 # Error Code 
}

# Check if an element is inside a list 
# @Params [Element] [arg1 arg2 ... argN]
# @Return 0 for Yes, 1 for No
isElementInList () {
  for e in "${@:2}"; 
  do 
    if [[ "$e" == "$1" ]]; then
      return 0;
    fi 
  done
  return 1
}

# Check if inputs are valid.
# @Param [Command Line arguments]
validateInputs () {
  if [ $# -lt 1 ]; then
    exitErrMsg 1  "Not enough arguments\nUsage: ./install.sh --load <package name>"
  fi

  options=("--save" "--load" "--clean" "--list" "--remove" "--help") 

  if ! isElementInList "$1" "${options[@]}"; then
    exitErrMsg 1 "Invalid: First argument needs to be one of the following:\n--save, --load, --clean, --list, --remove, or --help"
  fi


  if isElementInList "$1" "--list" "--clean" "--help"; then
    if [ "$#" -eq 2 ] ; then
      if [ "$2" == "-s" ]; then
        with_sudo=true
      else
        exitErrMsg 1 "Invalid arguments\nSample usage: ./install.sh $1"
      fi
    fi
    if [ $# -gt 2 ]; then
      exitErrMsg 1  "Too many arguments for $1\nSample usage: ./install.sh $1"
    fi
  fi


  if isElementInList "$1" "--load" "--save" "--remove"; then
    if [ "$#" -eq 3 ]; then
      if [ "$3" == "-s" ]; then
        with_sudo=true
      else
        exitErrMsg 1 "Invalid arguments\nSample usage: ./install.sh $1 <package name>"
      fi
    fi

    if [ $# -lt 2 ]; then
      exitErrMsg 1  "Not enough arguments for $1. Need a target name.\nSample usage: ./install.sh $1 <package name>"
    elif [ $# -gt 3 ]; then 
      exitErrMsg 1  "Too many arguments for $1.\nSample usage: ./install.sh $1 <package name>"
    fi
  fi

}

# Run Request
# @Params [Command Line arguments]
runRequest () {
  case "$1" in 
    "--load" )
      runLoadRequest $@
      ;;

    "--save" )
      runSaveRequest $@
      ;;

    "--remove" )
      runRemoveRequest $@
      ;;

    "--clean" )
      runCleanRequest
      ;;

    "--list" )
      runListRequest
      ;;

    "--help" )
      runHelpRequest
      ;;
  esac
}

# Run Clean Request 
runCleanRequest () {
  echo "Your current vim configuration (eg: .vim/ .vimrc) will be deleted." 
  prompt="Do you want to continue? (y/n) "
  if isYesOnConfirmation "$prompt"; then
    cleanVimLocation
  else
    echo "Request cancelled. Nothing has changed."
  fi
}

# Clean current .vim/ and .vimrc
# @Return 0 on success, 1 on failure
cleanVimLocation () {
  echo "Cleaning..."
  if [ -d "$vim_location" ]; then
    if [ "$with_sudo" = true ]; then 
      sudo rm -rf "$vim_location" || exitErrMsg 5 "Can't remove $vim_location."
    else
      rm -rf "$vim_location" || exitErrMsg 5 "Can't remove $vim_location."
    fi
  fi

  if [ -e "$vimrc_location" ]; then
    if [ "$with_sudo" = true ]; then 
      sudo rm -f "$vimrc_location" || exitErrMsg 5 "Can't remove $vimrc_location."
    else
      rm -f "$vimrc_location" || exitErrMsg 5 "Can't remove $vimrc_location."
    fi
  fi
  echo "Done. Successfully cleaned the current vim configuration."
  return 0
}

# Load existing target to vim settings
# @Param [Target Name]
loadTargetToVim () {
  target="$1"
  package="$packages_location/$target.tar.gz"

  cleanVimLocation

  echo "Loading..."

  mkdir "$vim_location" || exitErrMsg 3 "Can't create $vim_location."
  cd `dirname $vim_location`
  tar -xzf "$package" || exitErrMsg 3 "Can't extract target."

  echo "Done. Successfully loaded '$target' target"
}

# Run Load Request 
# @Params [Command Line arguments AFTER the second one, a.k.a. after --load]
runLoadRequest () {
  target="$2"
  package="$packages_location/$target.tar.gz"

  if [ -e "$package" ]
  then 
    echo "'$target' target will replace your current vim configuration (eg: .vim/ .vimrc)." 
    prompt="Do you want to continue? (y/n) "
    if isYesOnConfirmation "$prompt"; then
      loadTargetToVim "$target"
    else
      echo "Request cancelled. Nothing has changed."
    fi
  else
    exitErrMsg 3 "'$target' target is not found."
  fi
}

# Prompt message and ask for y/n confirmation. 
# Keep repeating until get the confimration.
# @Param [Message]
# @Return 0 for y/Y, 1 for n/N
isYesOnConfirmation () {
  while true
  do
    read -p "$1" choice
    case "$choice" in 
      y|Y ) 
        return 0 # True
        ;;
      n|N ) 
        return 1 # False
        ;;
      * ) 
        echo "Invalid input. Please retry."
        ;;
    esac
  done
}

preparePackageLocation () {
  if [ -e "$packages_location" ]
  then
    # if 'pkgs' exists, but it is not a directory <-- user's illegal activity
    if [ ! -d "$packages_location" ]; then
      exitErrMsg 2 "Can't have 'pkgs' file in the installer directory.\nThat name is reserved for the package directory."
    fi

  else
    mkdir "$packages_location"
  fi
}

# Run Save Request 
# @Params [Command Line arguments AFTER the second one, a.k.a. after --save]
runSaveRequest () {
  preparePackageLocation

  target="$2"
  package="$packages_location/$target.tar.gz"

  if [ -e "$package" ]
  then 
    prompt="'$target' target already exists. Do you want to replace it? (y/n) "
    if isYesOnConfirmation "$prompt"; then
      saveVimToTarget "$target"
    else
      echo "Request cancelled. Nothing has changed."
      exit 0
    fi

  else
    saveVimToTarget "$target"
  fi 
}

# Save .vim/ and .vimrc to target 
# @Param [Target Name]
saveVimToTarget () {
  target="$1"
  package="$packages_location/$target.tar.gz"
  echo "Saving... "
  if [ -d `dirname $vim_location` ]; then
    cd `dirname $vim_location`
  else
    exitErrMsg 2 "Can't go to directory `dirname $vim_location`"
  fi

  if [[ ( -d "$vim_location" ) && ( -e "$vimrc_location" ) ]]; then
    tar -zcf "$package" `basename $vim_location` `basename $vimrc_location` || exitErrMsg 2 "Can't zipping package."
  elif [  -d "$vim_location" ]; then
    tar -zcf "$package" `basename $vim_location` || exitErrMsg 2 "Can't zipping package."
  elif [ -e "$vimrc_location" ]; then
    tar -zcf "$package" `basename $vimrc_location` || exitErrMsg 2 "Can't zipping package."
  else
    exitErrMsg 2 "Can't find one of the following:\n$vim_location\n$vimrc_location"
  fi
  echo "Done. Successfully saved to '$target' target the following:"
  if [  -d "$vim_location" ]; then
    echo $vim_location
  fi
  if [ -e "$vimrc_location" ]; then
    echo $vimrc_location
  fi
  echo
  echo "To load it next time, use:"
  echo "./install.sh --load $target"
}

# Run Remove Request to remove the target package. 
# @Params [Command Line arguments AFTER the second one, a.k.a. after --remove]
runRemoveRequest () {
  target="$2"
  package="$packages_location/$target.tar.gz"
  if [ -e "$package" ];
  then
    prompt="Are you sure you want to remove '$target' target? (y/n) "
    if isYesOnConfirmation "$prompt"; then
      echo "Removing..."
      if [ "$with_sudo" = true ]; then
        sudo rm -f "$package" || exitErrMsg 4 "Can't remove '$target' target."
      else
        rm -f "$package" || exitErrMsg 4 "Can't remove '$target' target."
      fi
      echo "Done. Successfully removed '$target' target."
    else
      echo "Request cancelled. Nothing has changed."
    fi
  else
    exitErrMsg 4 "Can't find '$target' target."
  fi
}

# Run List Request to list all target names 
runListRequest () {
  if [ -d "$packages_location" ]; then
    cd "$packages_location"
    for target in *.tar.gz;
    do
      echo "${target%%.*}"
    done
  fi
}

# Run Help Request 
runHelpRequest () {
  echo " Usage: ./install.sh [command] [optional argument]
  The [command] can be one of the following:

  --save <package name> 
  saves/backups your ~/.vimrc and ~/.vim/ to a package named <package name>

  --load <package name> 
  loads/restores your ~/.vimrc and ~/.vim/ from the package named <package name>

  --list 
  lists all packages in the pkgs/ of this program directory

  --remove <package name> 
  removes the package named <package name>

  --clean 
  deletes the current ~/.vimrc and ~/.vim/


  [Optional Flag]
  -s
  uses sudo in some subroutines of certain tasks (eg: --load --clean --remove);
  place at the last argument
  "
}



### BEGIN ###

validateInputs $@
runRequest $@
exit 0

### END ###
