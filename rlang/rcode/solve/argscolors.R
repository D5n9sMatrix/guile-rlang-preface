#!/usr/bin/r

colblue <- c("Hello ", "world!")
cat(colblue)

cat("... to highlight the", c("search term"),
    "in a block of text\n")

## Style stack properly
cat(col_green(
  "I am a green line ",
  col_blue(style_underline(style_bold("with a blue substring"))),
  " that becomes green again!"
))

error <- c("red", "bold")
warn <- c("magenta", "underline")
note <- c(error, warn)
cat(c("Error: subscript out of bounds!\n"))
cat(c("Warning: shorter argument was recycled.\n"))
cat(c("Note: no such directory.\n"))

# style_no_* functions, note that the color is not removed
style_italic(col_green(paste0(
  "italic before, ",
  style_no_italic("normal here, "),
  "italic after"
)))

# avoiding  color for sub string
c(c(paste(
  "red before",
  c("not red between"),
  "red after"
)))

