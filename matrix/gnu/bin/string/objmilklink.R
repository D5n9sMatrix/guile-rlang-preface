#!/usr/bin/r

# Robust Line Fitting
# Description
# Fit a line robustly as recommended in Exploratory Data Analysis.

# Currently by default (iter = 1) the initial median-median line is 
# not iterated (as opposed to Tukey's “resistant line” in the references).


# Usage
x <- matrix(data = 100, nrow = 100, ncol = 80, byrow = FALSE, dimnames = NULL)
y <- matrix(data = 100, nrow = 100, ncol = 80, byrow = FALSE, dimnames = NULL)

line(x, y, iter = 1)
# NAN NAN

# Arguments
# x, y	
# the arguments can be any way of specifying x-y pairs. See xy.coords.

# iter	
# positive integer specifying the number of “polishing” iterations. 
# Note that this was hard coded to 1 in R versions before 3.5.0, and 
# more importantly that such simple iterations may not converge, see 
# Siegel's 9-point example.

# Details
# Cases with missing values are omitted.

# Contrary to the references where the data is split in three 
# (almost) equally sized groups with symmetric sizes depending 
# on n and n %% 3 and computes medians inside each group, the 
# line() code splits into three groups using all observations 
# with x[.] <= q1 and x[.] >= q2, where q1, q2 are (a kind of) 
# quantiles for probabilities p = 1/3 and p = 2/3 of the form 
# (x[j1]+x[j2])/2 where j1 = floor(p*(n-1)) and j2 = 
# ceiling(p(n-1)), n = length(x).

# Long vectors are not supported yet.



# Value
# An object of class "tukeyline".

# Methods are available for the generic functions coef, residuals, fitted, and print.

# References
# Tukey, J. W. (1977). Exploratory Data Analysis, Reading Massachusetts: Addison-Wesley.

# Velleman, P. F. and Hoaglin, D. C. (1981). Applications, Basics and Computing of Exploratory 
# Data Analysis, Duxbury Press. Chapter 5.

# Emerson, J. D. and Hoaglin, D. C. (1983). Resistant Lines for y versus x. Chapter 5 of 
# Understanding Robust and Exploratory Data Analysis, eds. David C. Hoaglin, Frederick 
# Mosteller and John W. Tukey. Wiley.

# Iain M. Johnstone and Paul F. Velleman (1985). The Resistant Line and Related Regression 
# Methods. Journal of the American Statistical Association, 80, 1041–1054. doi: 10.2307/2288572.

# See Also
# lm.

# There are alternatives for robust linear regression more robust and more (statistically) 
# efficient, see rlm() from MASS, or lmrob() from robustbase.

# Examples
require(graphics)

plot(cars)
(z <- line(cars))
abline(coef(z))
## Tukey-Anscombe Plot :
plot(residuals(z) ~ fitted(z), main = deparse(z$call))

## Andrew Siegel's pathological 9-point data, y-values multiplied by 3:
d.AS <- data.frame(x = c(-4:3, 12), y = 3*c(rep(0,6), -5, 5, 1))
cAS <- with(d.AS, t(sapply(1:10,
                   function(it) line(x,y, iter=it)$coefficients)))
dimnames(cAS) <- list(paste("it =", format(1:10)), c("intercept", "slope"))
cAS
## iterations started to oscillate, repeating iteration 7,8 indefinitely



