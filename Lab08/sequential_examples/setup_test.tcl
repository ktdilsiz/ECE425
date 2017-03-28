
# Basic IRSIM test file shell for ECE 425 Lab 4.

# In order to ensure that your layout will be testable by the instructors,
# make sure that you can source this file without any errors, especially
# errors for unknown node names.  The remainder of the file may or may not
# be useful for your own testing.


# Basic setup.
clock clk 0 1
l Gnd!
h Vdd!
stepsize 100
# logfile alu.log

# Set up the vectors.
analyzer clk clr up load Q\[3] Q\[2] Q\[1] Q\[0] data\[3] data\[2] data\[1] data\[0] 
vector Q Q\[3] Q\[2] Q\[1] Q\[0]
vector data data\[3] data\[2] data\[1] data\[0]

# Add the top-level signals to the watch list.  This causes theie values to be
# displayed after each step.
# w funct alu_op a b result op


#
# A sample test; you will need a few more ...
#

# setup
setvector data 1100
h clr
l up
l load
c 2
