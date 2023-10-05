#!/usr/bin/r

# Divide into Groups and Reassemble
# Description
# split divides the data in the vector x into the groups defined by f. 
# The replacement forms replace values corresponding to such a division. 
# unsplit reverses the effect of split.

# Usage
cAS <- with(d.AS, t(sapply(1:10,
                   function(it) line(x,y, iter=it)$coefficients))) 
dimnames(cAS) <- list(paste("it =", format(1:10)), c("intercept", "slope"))
f <- cAS
x <- cAS
split(x, f, drop = FALSE)
## Default S3 method:
split(x, f, drop = FALSE, sep = ".", lex.order = FALSE)

milks <- split(x, f, drop = FALSE)
unsplit(milks, f, drop = FALSE)

