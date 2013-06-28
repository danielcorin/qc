#qc
qc is for the times when you just want the answer to a math problem. Using bash and the python math library, qc accepts in-line math equations with no pipes or command line tricks. The result of the calculation is output to the command line and automatically copied to the clipboard for easy of use.

#Installing qc
* Download the source code
* Save the code in a plain text file named qc.sh
* Move the script to a directory where it will not be modified
* Make the script executable using the command: `chmod +x qc.sh`
* Go to the home folder in the command line using the `cd` command
* Open the `.bashrc`, `.bash_profile`, `.bash_aliases` or whatever file contains your `PATH` and aliases
* Add the code `alias qc="/path/to/qc.sh"` to the file, save and close
* You should be ready to use the script!

#Usage
qc <expression\>

Expression should be surrounded quotes or have no spaces.

Expressions with parentheses require quotes.

Options:

-a: about

-g: gnuplot

-h: help

-o: Octave shell

-np: Python shell with numpy library

-sp: Python shell with scipy library

-s: Python shell with math library

-v: version


#Examples

Addition

	shell$ qc 3.1+8
	11.1

Subtraction with constants

	shell$ qc pi-3
	0.14159265359

Calling functions

	shell$ qc "2*exp(2)"
	14.7781121979

Bitwise operators

	shell$ qc '1 << 8'
	256
	
Convert hexidecimal to decimal
	
	shell$ qc 0x100
	256
	
Convert binary to decimal

	shell$ qc 0b1000
	8

Convert decimal to hexidecimal
	
	shell$ qc "hex(256)"
	0x100
	
Factorial

	shell$ qc "factorial(10)"
	3628800

qc evaluates statements with the Python interpreter. The entire Python math library has been made available using a wildcard import: `from math import *`. Its documentation can be found [here](http://docs.python.org/2/library/math.html). The rest of Python's functionality can be found at the [Python standard library page](http://docs.python.org/2.7/library/) A wildcard import allows the functions from the math library to be called without using the `math` library name before the function. More specifically, `math.sqrt()` is shortened to just `sqrt()`.

An example using the `sqrt()` function in qc:

	shell$ qc "sqrt(9.5)"
	3.08220700148


#Versions
0.1: Pass command line input to Python interpreter for calculation

0.2: Add output to clipboard (for OSX)

0.3: Add output to clipboard Linux, scientific programming shortcuts
