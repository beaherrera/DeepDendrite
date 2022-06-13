#!/bin/bash

echo "" > /tmp/temp.tmp

idir=/Applications/NEURON-7.7/nrn

#for testing on linux
#idir=$HOME/neuron/nrnmpi
#function osascript() {
#  echo "osascript $1 $2 button returned:Yes" >> /tmp/temp.tmp
#  echo "button returned:Yes"
#}

#Use .bashrc if it exists, otherwise .bash_profile
#also add to .cshrc, .tcshrc, .kshrc, and  .zshrc if they exist
b=.bashrc
if test ! -f "$HOME/$b" ; then
  b=.bash_profile
fi
bp=$HOME/$b
blike="$bp"
clike=''
if test -f "$HOME/.cshrc" ; then
  clike="$HOME/.cshrc"
fi
if test -f "$HOME/.tcshrc" ; then
  clike="$clike $HOME/.tcshrc"
fi
if test -f "$HOME/.zshrc" ; then
  blike="$blike $HOME/.zshrc"
fi
if test -f "$HOME/.kshrc" ; then
  blike="$blike $HOME/.kshrc"
fi

# if cannot find nrniv, then perhaps modify PATH
echo "PATH=$PATH" >> /tmp/temp.tmp
# can nrniv be found in the users path?
if test -f "$bp" ; then
  (source $bp ; echo "srcpath $PATH" >> /tmp/temp.tmp ; echo `which nrniv` >> /tmp/temp.tmp ; which nrniv)
  a=$?
  echo "1 a=$a" >> /tmp/temp.tmp
  if test "$a" = "0" ; then
    addpath=yes
  else
    addpath=yes
  fi
  echo "PATH=$PATH" >> /tmp/temp.tmp
  echo "in source addpath=$addpath" >> /tmp/temp.tmp
else
  addpath=yes
fi
echo "PATH=$PATH" >> /tmp/temp.tmp

echo "1 addpath=$addpath" >> /tmp/temp.tmp

if test "$addpath" = "yes" ; then
a=`osascript -e 'tell app "Installer" to display dialog "
Modify PATH to allow launching nrniv from Terminal?
  ... will append a line to  $HOME/'$b'
      and, if they exist, .cshrc .tcshrc .kshrc .zshrc
" buttons {"No", "Yes"} default button 2'`
  echo "2 a=$a" >> /tmp/temp.tmp
  if test "$a" = "button returned:Yes" ; then
    addpath=yes
  else
    addpath=no
  fi
fi

echo "2 addpath=$addpath" >> /tmp/temp.tmp

if test "$addpath" = "yes" ; then
  if test  ! -f "$bp" ; then
    echo '#!bin/bash' > "$bp"
  fi
  for i in $blike ; do
    echo "export PATH=\"$idir/x86_64/bin\":\$PATH #added by NEURON installer" >> "$i"
    chown $USER "$i"
  done
  for i in $clike != "" ; do
    echo "set path = (\"$idir/x86_64/bin\" \$path) #added by NEURON installer" >> "$i"
    chown $USER "$i"
  done
fi

if true || test "$addpath" = "yes" ; then # Python environment
  addpyenv=no

  a=`osascript -e 'tell app "Installer" to display dialog "
Modify PYTHONPATH in $HOME/'$b' to allow a launch of Python to import neuron.
" buttons {"No", "Yes"} default button 2'`

  echo "3 a=$a" >> /tmp/temp.tmp
  if test "$a" = "button returned:Yes" ; then
    addpyenv=yes
  else
    addpyenv=no
  fi

  if test "$addpyenv" = "yes" ; then
    for i in $blike ; do
      echo "export PYTHONPATH=\"$idir/lib/python\":\$PYTHONPATH #added by NEURON installer" >> "$i"
      chown $USER "$i"
    done
    for i in $clike ; do
      echo "setenv PYTHONPATH \"$idir/lib/python\":\$PYTHONPATH #added by NEURON installer" >> "$i"
      chown $USER "$i"
    done
   if false ; then # no longer add NRN_PYLIB and PYTHONHOME
    tmpfile=/tmp/$$.tmp
    (source $bp ; echo "srcpath $PATH" >> /tmp/temp.tmp ; $idir/x86_64/bin/nrnpyenv.sh |sed -n 's/\(^export.*\)/\1 #added by NEURON installer/p' | sed '/PYTHONPATH/d' > $tmpfile)
    for i in $blike ; do
      cat $tmpfile >> "$i"
      chown $USER "$i"
    done
    for i in $clike ; do
      sed 's/export \(.*\)=\(".*"\)\(.*\)/setenv \1 \2 \3/' < $tmpfile >> "$i"
      chown $USER "$i"
    done
    rm -f $tmpfile
   fi
  fi
fi

if true ; then # notice that Command Line Tools and XQuartz also need to be installed.
osascript -e 'tell app "Installer" to display dialog "NEURON 7.7 was successfully installed, but ...
Mod files cannot be linked into NEURON unless
Command Line Tools is installed,
and NEURON cannot launch unless XQuartz is installed.
If either or both are not installed, you will be asked
if you wish to install them. You may wish to install
XQuartz last as it requires logging out at the end.
(After closing this dialog, you can close the NEURON installer).

" buttons {"Continue"}'
fi

# install command line tools?
if gcc -v ; then 
  true
else
  true
fi

#single click button action for x11 when entering a window
#focus follows mouse
sudo -u $USER defaults write org.macosforge.xquartz.X11 wm_ffm -bool true
echo "defaults write" >> /tmp/temp.tmp

# install XQuartz?
if /usr/X11/bin/xauth version ; then
  true
else
  true
fi

