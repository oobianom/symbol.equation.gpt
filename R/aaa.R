.onLoad <- function(lib,pkg) {
 cat("\U02611 Launching symbols UI")
}

.onAttach <- function(lib,pkg) {
  cat("\U02611 Attaching symbols UI")
}


# tabs in the tabset
tab2 <- nextGenShinyApps::tabPanel("Equations", shiny::div(
  shiny::tags$textarea(class='mathdoxformula2'),
))
tab3 <- nextGenShinyApps::tabPanel("Symbols", shiny::div(
  r2symbols::symCat(category = "symbol", font.color = "gray", font.weight = "light", font.size = 32)
))
tab4 <- nextGenShinyApps::tabPanel("Greek Letters", shiny::div(
  r2symbols::symCat(category = "mixed", font.color = "gray", font.weight = "light", font.size = 32)
))
tab5 <- nextGenShinyApps::tabPanel("Arrows", shiny::div(
  r2symbols::symCat(category = "arrows", font.color = "gray", font.weight = "light", font.size = 32)
))
tab1 <- nextGenShinyApps::tabPanel("Emojis", shiny::div(
  r2symbols::symCat(category = "smiley", font.color = "gray", font.weight = "light", font.size = 32)
))
tab0 <- nextGenShinyApps::tabPanel("Home", shiny::div(
  # shiny::withMathJax(shiny::includeMarkdown(file.path(lib.loc(),"introduction.md")))
  shiny::withMathJax(shiny::includeMarkdown("https://symbols-ui.obi.obianom.com/assets/introduction.md"))
))
