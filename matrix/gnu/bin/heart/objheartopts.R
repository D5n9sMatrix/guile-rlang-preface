#!/usr/bin/r

# Compactly Display the Structure of an Arbitrary R Object
# Description
# Compactly display the internal structure of an R object, a diagnostic 
# function and an alternative to summary (and to some extent, dput). Ideally, 
# only one line for each ‘basic’ structure is displayed. It is especially well 
# suited to compactly display the (abbreviated) contents of (possibly nested) 
# lists. The idea is to give reasonable output for any R object. It calls args 
# for (non-primitive) function objects.

# strOptions() is a convenience function for setting options(str = .), see the examples.

# Usage
str(x)

## S3 method for class 'data.frame'
str(x)

## Default S3 method:
# str(object, max.level = NA,
#    vec.len  = strO$vec.len, digits.d = strO$digits.d,
#    nchar.max = 128, give.attr = TRUE,
#    drop.deparse.attr = strO$drop.deparse.attr,
#    give.head = TRUE, give.length = give.head,
#    width = getOption("width"), nest.lev = 0,
#    indent.str = paste(rep.int(" ", max(0, nest.lev + 1)),
#                       collapse = ".."),
#    comp.str = "$ ", no.list = FALSE, envir = baseenv(),
#    strict.width = strO$strict.width,
#    formatNum = strO$formatNum, list.len = strO$list.len,
#    deparse.lines = strO$deparse.lines)

# strOptions(strict.width = "no", digits.d = 3, vec.len = 4,
#           list.len = 99, deparse.lines = NULL,
#           drop.deparse.attr = TRUE,
#           formatNum = function(x, ...)
#                       format(x, trim = TRUE, drop0trailing = TRUE, ...))

# Arguments

# object	
# any R object about which you want to have some information.

# max.level	
# maximal level of nesting which is applied for displaying nested structures, 
# e.g., a list containing sub lists. Default NA: Display all nesting levels.

# vec.len	
# numeric (>= 0) indicating how many ‘first few’ elements are displayed of 
# each vector. The number is multiplied by different factors (from .5 to 3) 
# depending on the kind of vector. Defaults to the vec.len component of option 
# "str" (see options) which defaults to 4.

# digits.d	
# number of digits for numerical components (as for print). Defaults to the 
# digits.d component of option "str" which defaults to 3.

# nchar.max	
# maximal number of characters to show for character strings. Longer strings 
# are truncated, see longch example below.

# give.attr	
# logical; if TRUE (default), show attributes as sub structures.

# drop.deparse.attr	
# logical; if TRUE (default), deparse(control = <S>) will not have 
# "showAttributes" in <S>. Used to be hard coded to FALSE and hence 
# can be set via strOptions() for back compatibility.

# give.length	
# logical; if TRUE (default), indicate length (as [1:...]).

# give.head	
# logical; if TRUE (default), give (possibly abbreviated) 
# mode/class and length (as <type>[1:...]).

# width	
# the page width to be used. The default is the currently 
# active options("width"); note that this has only a weak 
# effect, unless strict.width is not "no".

# nest.lev	
# current nesting level in the recursive calls to str.

# indent.str	
# the indentation string to use.

# comp.str	
# string to be used for separating list components.

# no.list	
# logical; if true, no ‘list of ...’ nor the class are printed.

# envir	
# the environment to be used for promise (see delayedAssign) objects only.

# strict.width	
# string indicating if the width argument's specification should be followed 
# strictly, one of the values c("no", "cut", "wrap"), which can be abbreviated. 
# Defaults to the strict.width component of option "str" (see options) which 
# defaults to "no" for back compatibility reasons; "wrap" uses strwrap(*, width = width) 
# whereas "cut" cuts directly to width. Note that a small vec.length may be better than 
# setting strict.width = "wrap".

# formatNum	
# a function such as format for formatting numeric vectors. It defaults to the formatNum 
# component of option "str", see “Usage” of strOptions() above, which is almost back compatible 
# to R <= 2.7.x, however, using formatC may be slightly better.

# list.len	
# numeric; maximum number of list elements to display within a level.

# deparse.lines	
# numeric or NULL as by default, determining the nlines argument to deparse() 
# when object is a call. When NULL, the nchar.max and width arguments are used 
# to determine a smart default.

# ...	
# potential further arguments (required for Method/Generic reasons).

# Value
# str does not return anything, for efficiency reasons. The obvious side 
# effect is output to the terminal.

# Note
# See the extensive annotated ‘Examples’ below.

# The default method tries to “work always”, but needs to make some assumptions 
# for the case when object has a class but no own str() method which is the typical 
# case: There it relies on "[" and "[[" subsetting methods to be compatible with length(). 
# When this is not the case, or when is.list(object) is TRUE, but length(object) differs 
# from length(unclass(object)) it treats it as “irregular” and reports the contents of 
# unclass(object) as “hidden list”.

# Author(s)
# Martin Maechler maechler@stat.math.ethz.ch since 1990.

# See Also
# ls.str for listing objects with their structure; summary, args.

# Examples
require(stats); require(grDevices); require(graphics)
## The following examples show some of 'str' capabilities
str(1:12)
str(ls)
str(args) #- more useful than  args(args) !
str(freeny)
str(str)
str(.Machine, digits.d = 20) # extra digits for identification of binary numbers
str( lsfit(1:9, 1:9))
str( lsfit(1:9, 1:9), max.level = 1)
str( lsfit(1:9, 1:9), width = 60, strict.width = "cut")
str( lsfit(1:9, 1:9), width = 60, strict.width = "wrap")
op <- options(); str(op)   # save first;
                           # otherwise internal options() is used.
need.dev <-
  !exists(".Device") || is.null(.Device) || .Device == "null device"
{ if(need.dev) postscript()
  str(par())
  if(need.dev) graphics.off()
}
ch <- letters[1:12]; is.na(ch) <- 3:5
str(ch) # character NA's

str(list(a = "A", L = as.list(1:100)), list.len = 9)
##                                     ------------
## " .. [list output truncated] "

## Long strings,   'nchar.max'; 'strict.width' :
nchar(longch <- paste(rep(letters,100), collapse = ""))
str(longch)
str(longch, nchar.max = 52)
str(longch, strict.width = "wrap")

## Multibyte characters in strings (in multibyte locales):
oloc <- Sys.getlocale("LC_CTYPE")
mbyte.lc <- if(.Platform$OS.type == "windows")
 "English_United States.28605" else "en_GB.UTF-8"
try(Sys.setlocale("LC_CTYPE", mbyte.lc))
## Truncation behavior (<-> correct width measurement) for "long" non-ASCII:
idx <- c(65313:65338, 65345:65350)
fwch <- intToUtf8(idx) # full width character string: each has width 2
ch <- strtrim(paste(LETTERS, collapse="._"), 64)
(ncc <- c(c.ch = nchar(ch),   w.ch = nchar(ch,   "w"),
          c.fw = nchar(fwch), w.fw = nchar(fwch, "w")))
stopifnot(unname(ncc) == c(64,64, 32, 64))
## nchar.max: 1st line needs an increase of  2  in order to see  1  (in UTF-8!):
invisible(lapply(60:66, function(N) str(fwch, nchar.max = N)))
invisible(lapply(60:66, function(N) str( ch , nchar.max = N))) # "1 is 1" here
## revert locale to previous:
Sys.setlocale("LC_CTYPE", oloc)


## Settings for narrow transcript :
op <- options(width = 60,
              str = strOptions(strict.width = "wrap"))
str(lsfit(1:9,1:9))
str(options())
## reset to previous:
options(op)



str(quote( { A+B; list(C, D) } ))



## S4 classes :
require(stats4)
x <- 0:10; y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
ll <- function(ymax = 15, xh = 6)
      -sum(dpois(y, lambda=ymax/(1+x/xh), log=TRUE))
fit <- mle(ll)
str(fit)