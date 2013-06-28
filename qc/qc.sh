#!/bin/bash

VERSION=0.2

if [ $# -ne 1 ];
then
	echo
	echo qc version $VERSION
	echo
	echo USAGE:
	echo "qc <expression>"
	echo "Argument should be surrounded quotes or have no spaces."
	echo Options:	
	echo -a: about
	echo -h: help
	echo -np: shell with numpy library
	echo -sp: shell with scipy library
	echo -s: shell with math library
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
	echo Special thanks to Dave D\'Alessandro
	echo
	exit
	;;
-h)	echo	
	echo "Using qc:"
	echo "qc passes its input argument directly to the python intepreter with its full math library imported."
	echo "It uses the python syntax for operators:"
	echo "Addition: 1+4"
	echo "Subtract: 3-pi"
	echo "Multiply: 6*7"
	echo "Divide: 3.0/8"
	echo "Powers: 2**10"
	echo "It will handle simple expression such as 10**8+1 nicely."
	echo "More complex expression must be passed with quotes: \"exp(2.7)\""
	echo
	exit
	;;
-s) echo "Opening Python shell with math library..."
	python -ic "from math import *";
	exit
	;;
-np) echo "Opening Python shell with numpy library..."
	python -ic "from numpy import *";
	exit
	;;
-sp) echo "Opening Python shell with scipy library..."
	python -ic "from scipy import *";
	exit
	;;
-v) echo
	echo qc version $VERSION
	echo
	exit
	;;
esac

python -c "from math import *; print $1" | pbcopy
pbpaste


