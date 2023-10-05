#!/usr/bin/r

# Row Indexes
# Description
# Returns a matrix of integers indicating their row number 
# in a matrix-like object, or a factor indicating the row 
# labels.

# Usage

row(x, as.factor = FALSE)
.row(dim(x))

# Arguments
# x	
# a matrix-like object, that is one with a two-dimensional dim.

# dim	
# a matrix dimension, i.e., an integer valued numeric vector of 
# length two (with non-negative entries).

# as.factor	
# a logical value indicating whether the value should be returned 
# as a factor of row labels (created if necessary) rather than as 
# numbers.

# Value
# An integer (or factor) matrix with the same dimensions as x and 
# whose ij-th element is equal to i (or the i-th row label).

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New 
# S Language. Wadsworth & Brooks/Cole.

# See Also
# col to get columns; slice.index for a general way to get slice indices in an array.

# Examples
x <- matrix(1:100, 100, 80)
# extract the diagonal of a matrix - more slowly than diag(x)
dx <- x[row(x) == col(x)]
dx

# create an identity 5-by-5 matrix more slowly than diag(n = 5):
x <- matrix(0, nrow = 100, ncol = 80)
x[row(x) == col(x)] <- 0
x

(i34 <- .row(3:4))
stopifnot(identical(i34, .row(c(3,4)))) # 'dim' maybe "double"

