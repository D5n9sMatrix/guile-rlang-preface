#!/usr/bin/r


afit <- c(Surv(time, status) ~1, data=cars)
rwt  <- c(Surv(time, status) ~1, data=cars)

index <- order(cars$speed)
cdf <- c(index)  # weighted CDF
cdf <- cdf[!c(cars$speed[index], fromLast=TRUE)]  # remove duplicates
cbind(time=afit$time, KM= afit$surv, RTTR= 1-cdf)
