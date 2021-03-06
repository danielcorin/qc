# qc (quick calc)
qc is a command line tool that calculates in-line math expressions with no pipes or command line tricks. The result of the calculation is displayed in the the command line and automatically copied to the clipboard for ease of use.

# Installing qc
* Download the source code
* Save the code in a plain text file named qc.sh
* Move the script to a directory where it will not be modified
* Navigate to that directory in the command line and make script executable using the command: `chmod +x qc.sh`
* Go to the home folder in the command line using the `cd` command
* Open the `.bashrc`, `.bash_profile`, `.bash_aliases` or whatever file contains your `PATH` and aliases
* Add `alias qc="/path/to/qc.sh"` to the file, save and close
* You should be ready to use the script!

# Usage
`qc <expression>`

Expressions with parentheses or command line operators require quotes.

Options:

	-a: about
	
	-h: help
	
	-s: Python shell with math library
	
	-v: version
	

# Examples

Addition

	$ qc 3.1 + 8
	11.1

Subtraction with constants

	$ qc pi-3
	0.14159265359

Calling functions

	$ qc "2*exp(2)"
	14.7781121979

Bitwise operators

	$ qc '1 << 8'
	256
	
Convert hexidecimal to decimal
	
	$ qc 0x100
	256
	
Convert binary to decimal

	$ qc 0b1000
	8

Convert decimal to hexidecimal
	
	$ qc "hex(256)"
	0x100
	
Factorial

	$ qc "factorial(10)"
	3628800

qc evaluates statements with the Python interpreter. The entire Python math library has been made available using a wildcard import: `from math import *`. Its documentation can be found [here](http://docs.python.org/2/library/math.html). The rest of Python's functionality can be found at the [Python standard library page](http://docs.python.org/2.7/library/) A wildcard import allows the functions from the math library to be called without using the `math` library name before the function. More specifically, `math.sqrt()` is shortened to just `sqrt()`.

An example using the `sqrt()` function in qc:

	$ qc "sqrt(9.5)"
	3.08220700148


# Version history
0.1: Pass command line input to Python interpreter for calculation

0.2: Add output to clipboard (for OSX)

0.3: Add output to clipboard Linux, scientific programming shortcuts

0.4: Stripped down functionality to only obviously useful flags

0.5: Python 3 compatibility as suggested by Ondrej Nekola, accept spaces in input for standard math operators (+,-,\*,/,%)

# Known issues
May lag on first use while the Python interpreter starts
