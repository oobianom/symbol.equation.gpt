#' Instructions Document Loader
#'
#' Load Instruction document
#'
#' @export
#'

lib.loc <- function() file.path(find.package(package = "symbols.equations.ui"), "lib")



#' UI
#'
#' Assembles UI
#'
#' @export
#'
tab2 <- nextGenShinyApps::tabPanel("Equations", shiny::div(
  r2symbols::symKey(keyword = "sign", font.color = "gray", font.weight = "light", font.size = 32)
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

r2sym.ui <- nextGenShinyApps::fluidPage(
  # Theme: Select color style from 1-13
  style = "6",

  # set background color
  custom.bg.color = "#f5f5f5",

  # import scripts
  shiny::tags$head(
    shiny::tags$link(rel = "stylesheet", type = "text/css", href = "https://symbols-ui.obi.obianom.com/assets/master-ui-kit.css"),
    shiny::tags$script(src = "https://symbols-ui.obi.obianom.com/assets/master-ui-kit.js")
  ),


  # Header: Insert header content using titlePanel ------------
  header = nextGenShinyApps::titlePanel(
    left = "Symbols Interface",
    right = nextGenShinyApps::actionButton("closeapp", "", icon = shiny::icon("window-close"), style = "pill", bg.type = "primary")
  ),
  shiny::div(
    shiny::selectInput("symbolseqnui-copy-insert", "Copy or Insert", choices = c("Copy to Clipboard", "Insert in Document")),
    shiny::conditionalPanel(
      condition = "input.symbolseqnui-copy-insert == 'Insert in Document'",
      div(
        shiny::selectInput("symbolseqnui-insert-type", "Insert type", choices = c("Rmd: Insert Code", "Rmd: Insert Code with R chunk","Rmd: Insert Shorthand Code")),
        class = "pl-2"
      )
    ),
    class = "d-flex"
  ),
  nextGenShinyApps::tabsetPanel(

    tab0,
    tab1,
    tab2,
    tab3,
    tab4,
    tab5,
    type = "pills",
    justified = TRUE
  )
)
