#!/bin/bash

VERSION=0.3

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
	echo -g: gnuplot
	echo -h: help
	echo -o: Octave shell
	echo -np: Python shell with numpy library
	echo -sp: Python shell with scipy library
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
	echo "Modified from Dave D'Alessandro's idea for a \"reverse reverse Polish\"" calculator
	echo
	exit
	;;
-g) echo "Opening gnuplot..."
	gnuplot 2> /dev/null
	if [ $? -ne 0 ]; then
		echo
		echo "Octave not installed."
		echo "Get Octave here: http://www.gnuplot.info/"
	fi
	echo
	exit
	;;
-h)	echo	
	echo "Using qc:"
	echo
	echo "qc passes its input argument directly to the Python intepreter with the full math library imported."
	echo "Example of Python syntax for operators:"
	echo "Add: 1+4"
	echo "Subtract: 3-pi"
	echo "Multiply: 6.2*7"
	echo "Divide: 3.0/8"
	echo "Exponents: 2**10"
	echo "Modulus: 7%2"
	echo
	echo "It will handle simple expression such as 10**8+1 nicely."
	echo "Expressions with binary operators or parentheses must be passed with quotes: 'exp(2.7)' or \"1 << 4\""
	echo
	exit
	;;
-o) echo "Opening Octave..."
	octave 2> /dev/null
	if [ $? -ne 0 ]; then
		echo
		echo "Octave not installed."
		echo "Get Octave here: http://www.gnu.org/software/octave/"
	fi
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
-np) echo "Opening Python shell with numpy library..."
	python -ic "from numpy import *" 2> /dev/null
	if [ $? -ne 0 ]; then
		echo
		echo "Numpy not installed."
		echo "Get Numpy here: http://www.numpy.org/"
	fi
	echo
	exit
	;;
-sp) echo "Opening Python shell with scipy library..."
	python -ic "from scipy import *" 2> /dev/null
	if [ $? -ne 0 ]; then
		echo
		echo "Scipy not installed."
		echo "Get Scipy here: http://scipy.org/"
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
eval = $1
clipboard = gtk.clipboard_get()
clipboard.set_text('%s' % str(eval))
clipboard.store()
print eval" 2> /dev/null

elif [ "$PLATFORM" == "Darwin" ]; then
	python -c "from math import *; print $1" | pbcopy
	pbpaste
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