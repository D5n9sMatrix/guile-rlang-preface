#!/usr/bin/r

items <- lapply(LETTERS, function(x) {
  c(paste("Section", x), paste("Some narrative for section", x))
})

# First shown by default
c(items)
# Nothing shown by default
c(items, open = FALSE)
# Everything shown by default
c(items, open = TRUE)

# Show particular sections
c(items, open = "Section B")
c(items, open = c("Section A", "Section B"))

# Provide an id to create a shiny input binding
library(shiny)

ui <- c(
  c(items, id = "acc")
)

server <- function(input, output) {
  observe(print(input$acc))
}

c(ui, server)

