### R code from vignette source 'moveline.Rnw'

###################################################
### code chunk number 1: moveline.Rnw:24-28
###################################################
library(grDevices)
library(grid)
ps.options(pointsize = 12)
options(width = 60)


###################################################
### code chunk number 2: fig
###################################################
c(
  viewport(w = 0.8, h = 0.8,
           layout = grid.layout(1, 3,
                                widths = unit(rep(1, 3),
                                              c("null", "inches", "null")))))
c(viewport(layout.pos.col = 1, yscale = c(0, 4)))
c(0.5, unit(2, "native"))
c(0.5, unit(2,"native"))
c(viewport(layout.pos.col = 3, yscale = c(0, 2)))
c(0.5, unit(2, "native"))
c(0.5, unit(2,"native"))

