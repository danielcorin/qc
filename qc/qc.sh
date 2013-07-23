#!/bin/bash

VERSION=0.4

PLATFORM=$(uname)

if [ $# -ne 1 ];
then
	echo
	echo USAGE:
	echo "qc <expression>"
	echo "Expression should be surrounded quotes or have no spaces."
	echo "Expressions with parentheses require quotes."
	echo
	echo Options:	
	echo -a: about
	echo -h: help
	echo -s: Python shell with math library
	echo -v: version
	echo
	exit
fi

case "$1" in
-a)
	echo
	echo About qc:
	echo
	echo Written by Daniel Corin
	echo June 2013
	echo "Modified from Dave D'Alessandro's idea for prefix addition in the command line"
	echo
	exit
	;;
-h)	echo	
	echo "Using qc:"
	echo
	echo "qc passes its input argument directly to the Python intepreter with the full math library imported."
	echo
	echo "Examples using Python syntax for operators:"
	echo "Add: 1+4"
	echo "Subtract: 3-pi"
	echo "Multiply: 6.2*7"
	echo "Divide: 3.0/8"
	echo "Exponents: 2**10"
	echo "Modulus: 7%2"
	echo
	echo "It handles simple expression such as 10**8+1 nicely."
	echo "Expressions with binary operators or parentheses must be passed with quotes: 'exp(2.7)' or \"1 << 4\""
	echo
	exit
	;;
-s) echo "Opening Python shell with math library..."
	python -ic "from math import *" 2> /dev/null
	if [ $? -ne 0 ]; then
		echo
		echo "Python not installed."
		echo "Get Python here: http://python.org/"
	fi
	echo
	exit
	;;
-v) echo
	echo qc version $VERSION
	echo
	exit
	;;
esac

if [ "$PLATFORM" == "Linux" ]; then
# spacing is important here
	python -c "from math import *;
import pygtk
pygtk.require('2.0')
import gtk
evaluated = $1
clipboard = gtk.clipboard_get()
clipboard.set_text(str(evaluated))
clipboard.store()
print evaluated" 2> /dev/null

elif [ "$PLATFORM" == "Darwin" ]; then
	python -c "from math import *; print $1" 2> /dev/null | tr -d '\n' | pbcopy 
	pbpaste
	echo
else
	echo Platform $PLATFORM not supported.
fi

if [ $? -ne 0 ]; then
	echo
	echo "Invalid use."
	echo "See \"qc -h\" for help."
	echo
	exit 1
fi
