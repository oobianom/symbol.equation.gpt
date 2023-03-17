.onLoad <- function(lib, pkg) {
  cat("\U02611 Launching symbols UI")
}

.onAttach <- function(lib, pkg) {
  cat("\U02611 Attaching symbols UI")
}


# tabs in the tabset
tab2 <- nextGenShinyApps::tabPanel("Equation", nextGenShinyApps::tabsetPanel(
  nextGenShinyApps::tabPanel(
    "MathLive", shiny::div(
      shiny::HTML('
                <math-field id="mathliveformula" class="border border-secondary" onkeyup="setaltlatext(this)" onload="setaltlatext(this)" style="display:inline-grid;border-width: 2px!important; padding:20px; min-width:100%">
</math-field>')
    ),
    shiny::tags$div(
    shiny::tags$button(id = "downloadbtn", class = "border-top-0 bg-blue-300 p-2 border-secondary", "download  equation"),
    shiny::tags$button(id = "converttolatex", class = "border-top-0 bg-blue-300 p-2 border-secondary", "convert to LaTeX"),
    class="mb-3"
    ),
    shiny::tags$div(
      shiny::tags$input(id = "latextout", class="border-secondary p-3", style = "display:inline-block; min-width:100%"),
      shiny::tags$div(
      shiny::tags$button(id = "converttoequ", class = "border-top-0 bg-blue-300 p-2 border-secondary", "convert to Equation"),
      class="mb-3")
    )
  ),
  nextGenShinyApps::tabPanel("MathDox", shiny::div(
    shiny::tags$textarea(class = "mathdoxformula"),
    shiny::tags$button(id = "downloadbtn2", class = "border-top-0 bg-blue-300 p-2 border-secondary", "download  equation"),

  )),
  type = "pills",
  justified = TRUE
))
tab3 <- nextGenShinyApps::tabPanel("Symbol", shiny::div(
  r2symbols::symCat(category = "symbol", font.color = "gray", font.weight = "light", font.size = 32)
))
tab4 <- nextGenShinyApps::tabPanel("Greek", shiny::div(
  r2symbols::symCat(category = "mixed", font.color = "gray", font.weight = "light", font.size = 32)
))
tab5 <- nextGenShinyApps::tabPanel("Arrow", shiny::div(
  r2symbols::symCat(category = "arrows", font.color = "gray", font.weight = "light", font.size = 32)
))
tab1 <- nextGenShinyApps::tabPanel("Emoji", shiny::div(
  r2symbols::symCat(category = "emoji", font.color = "gray", font.weight = "light", font.size = 32)
))
tab6 <- nextGenShinyApps::tabPanel("Smiley", shiny::div(
  r2symbols::symCat(category = "smiley", font.color = "gray", font.weight = "light", font.size = 32)
))
tab0 <- nextGenShinyApps::tabPanel("Home", shiny::div(
  # shiny::withMathJax(shiny::includeMarkdown(file.path(lib.loc(),"introduction.md")))
  shiny::withMathJax(shiny::includeMarkdown("https://symbols-ui.obi.obianom.com/assets/introduction.md"))
))
