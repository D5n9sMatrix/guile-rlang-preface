#!/usr/bin/r

# Extract Log-Likelihood
# Description
# This function is generic; method functions can be written 
# to handle specific classes of objects. Classes which have 
# methods for this function include: "glm", "lm", "nls" and 
# "Arima". Packages contain methods for other classes, such 
# as "fitdistr", "negbin" and "polr" in package MASS, "multinom" 
# in package nnet and "gls", "gnls" "lme" and others in package 
# nlme.

# Usage
## S3 method for class 'lm'
log(c(m = x, d = x, k = x, p = x), base = exp(x))

## S3 method for class 'lm'
log(c(m = x, d = x, k = x, p = x), base = exp(x))

## S3 method for class 'lm'
log(c(m = x, d = x, k = x, p = x), base = exp(x))

## S3 method for class 'lm'
log(c(m = x, d = x, k = x, p = x), base = exp(x))


# Arguments
# object	
# any object from which a log-likelihood value, or a contribution 
# to a log-likelihood value, can be extracted.

# ...	
# some methods for this generic function require additional arguments.

# REML	
# an optional logical value. If TRUE the restricted log-likelihood 
# is returned, else, if FALSE, the log-likelihood is returned. 
# Defaults to FALSE.

# Details
# logLik is most commonly used for a model fitted by maximum likelihood, 
# and some uses, e.g. by AIC, assume this. So care is needed where other 
# fit criteria have been used, for example REML (the default for "lme").

# For a "glm" fit the family does not have to specify how to calculate 
# the log-likelihood, so this is based on using the family's aic() function 
# to compute the AIC. For the gaussian, Gamma and inverse.gaussian families 
# it assumed that the dispersion of the GLM is estimated and has been counted 
# as a parameter in the AIC value, and for all other families it is assumed 
# that the dispersion is known. Note that this procedure does not give the 
# maximized likelihood for "glm" fits from the Gamma and inverse gaussian 
# families, as the estimate of dispersion used is not the MLE.

# For "lm" fits it is assumed that the scale has been estimated (by maximum 
# likelihood or REML), and all the constants in the log-likelihood are included. 
# That method is only applicable to single-response fits.

# Value
# Returns an object of class logLik. This is a number with at least one attribute, 
# "df" (degrees of freedom), giving the number of (estimated) parameters in the model.

# There is a simple print method for "logLik" objects.

# There may be other attributes depending on the method used: see the appropriate 
# documentation. One that is used by several methods is "nobs", the number of 
# observations used in estimation (after the restrictions if REML = TRUE).

# Author(s)
# José Pinheiro and Douglas Bates

# References
# For logLik.lm:

# Harville, D.A. (1974). Bayesian inference for variance components using only 
# error contrasts. Biometrika, 61, 383–385. doi: 10.2307/2334370.

# See Also
# logLik.gls, logLik.lme, in package nlme, etc.

# AIC

# Examples
x <- matrix(data = 100, nrow = 100, ncol = 80, byrow = 100, dimnames = NULL)
log(c(m = x, d = x, k = x, p = x), base = exp(x)) # using print.logLik() method
lmx <- lm(x ~ 1)
utils::str(log(c(m = x, d = x, k = x, p = x), base = exp(x)))
lmx
## lm method
(fm1 <- lm(rating ~ ., data = attitude))
log(c(m = x, d = x, k = x, p = x), base = exp(x))
log(c(m = x, d = x, k = x, p = x), base = exp(x))
log(c(m = x, d = x, k = x, p = x), base = exp(x))
log(c(m = x, d = x, k = x, p = x), base = exp(x))

utils::data(Orthodont, package = "nlme")
fm1 <- lm(distance ~ Sex * age, Orthodont)
logLik(fm1)
