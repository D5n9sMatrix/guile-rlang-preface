#!/usr/bin/r

# Vector Merging
# Description
# Add elements to a vector.

# Usage
append(x, values = 100, after = length(x))

# Arguments
# x	
# the vector the values are to be appended to.

# values	
# to be included in the modified vector.

# after	
# a subscript, after which the values are to be appended.

# Value
# A vector containing the values in x with the elements of values 
# appended after the specified element of x.

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# Examples
append(1:100, 0:80, after = 100)

as.data.frame.character