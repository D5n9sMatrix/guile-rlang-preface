#!/usr/bin/r

# Create a Link for GLM Families

# Description
# This function is used with the family functions in glm(). 
# Given the name of a link, it returns a link function, an 
# inverse link function, the derivative dmu/deta and a 
# function for domain checking.

# Usage

# make.link(link)

# Arguments

# link	
# character; one of "logit", "probit", "cauchit", "cloglog", "identity", 
# "log", "sqrt", "1/mu^2", "inverse".

# Value
# A object of class "link-glm", a list with components

# linkfun	
# Link function function(mu)

# linkinv	
# Inverse link function function(eta)

# mu.eta	
# Derivative function(eta) dmu/deta

# valideta	
# function(eta){ TRUE if eta is in the domain of linkinv }.

# name	
# a name to be used for the link

# .

# See Also
# power, glm, family.

# Examples
utils::str(make.link("logit"))

