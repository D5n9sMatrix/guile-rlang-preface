#!/usr/bin/r

# Coerce to a Data Frame
# Description
# Functions to check if an object is a data frame, or coerce it if possible.

# Usage
as.data.frame(x, row.names = NULL, optional = FALSE)

## S3 method for class 'character'
as.data.frame(x,
              stringsAsFactors = FALSE)

## S3 method for class 'list'
as.data.frame(x, row.names = NULL, optional = FALSE,
              cut.names = FALSE, col.names = names(x), fix.empty.names = TRUE,
              check.names = !optional,
              stringsAsFactors = FALSE)

## S3 method for class 'matrix'
as.data.frame(x, row.names = NULL, optional = FALSE,
              make.names = TRUE,
              stringsAsFactors = FALSE)

is.data.frame(x)


# Arguments
# x	
# any R object.

# row.names	
# NULL or a character vector giving the row names for the data frame. 
# Missing values are not allowed.

# optional	
# logical. If TRUE, setting row names and converting column 
# names (to syntactic names: see make.names) is optional. 
# Note that all of R's base package as.data.frame() methods 
# use optional only for column names treatment, basically 
# with the meaning of data.frame(*, check.names = !optional). 
# See also the make.names argument of the matrix method.

# ...	
# additional arguments to be passed to or from methods.

# stringsAsFactors	
# logical: should the character vector be converted to a factor?

# cut.names	
# logical or integer; indicating if column names with more 
# than 256 (or cut.names if that is numeric) characters 
# should be shortened (and the last 6 characters replaced 
# by " ...").

# col.names	
# (optional) character vector of column names.

# fix.empty.names	
# logical indicating if empty column names, i.e., "" should be fixed up (in data.frame) or not.

# check.names	
# logical; passed to the data.frame() call.

# make.names	
# a logical, i.e., one of FALSE, NA, TRUE, indicating what should 
# happen if the row names (of the matrix x) are invalid. 
# If they are invalid, the default, TRUE, calls make.names(*, unique=TRUE); 
# make.names=NA will use “automatic” row names and a FALSE value will signal 
# an error for invalid row names.

# Details
# as.data.frame is a generic function with many methods, and users and packages 
# can supply further methods. For classes that act as vectors, often a copy of 
# as.data.frame.vector will work as the method.

# If a list is supplied, each element is converted to a column in the data frame. 
# Similarly, each column of a matrix is converted separately. This can be overridden 
# if the object has a class which has a method for as.data.frame: two examples are 
# matrices of class "model.matrix" (which are included as a single column) and list 
# objects of class "POSIXlt" which are coerced to class "POSIXct".

# Arrays can be converted to data frames. One-dimensional arrays are treated like 
# vectors and two-dimensional arrays like matrices. Arrays with more than two dimensions 
# are converted to matrices by ‘flattening’ all dimensions after the first and creating 
# suitable column labels.

# Character variables are converted to factor columns unless protected by I.

# If a data frame is supplied, all classes preceding "data.frame" are stripped, 
# and the row names are changed if that argument is supplied.

# If row.names = NULL, row names are constructed from the names or dimnames of x, 
# otherwise are the integer sequence starting at one. Few of the methods check 
# for duplicated row names. Names are removed from vector columns unless I

# Value
# as.data.frame returns a data frame, normally with all row names "" if optional = TRUE.

# is.data.frame returns TRUE if its argument is a data frame (that is, has "data.frame" amongst its classes) and FALSE otherwise.

# References
# Chambers, J. M. (1992) Data for models. Chapter 3 of Statistical Models 
# in S eds J. M. Chambers and T. J. Hastie, Wadsworth & Brooks/Cole.

# See Also

