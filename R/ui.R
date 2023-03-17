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


(nextGenShinyApps::fluidPage(
  # Theme: Select color style from 1-13
  style = "4",

  # set background color
  custom.bg.color = "#f5f5f5",

  # import scripts
  shiny::tags$head(
    shiny::tags$link(rel = "stylesheet", type = "text/css", href = "https://symbols-ui.obi.obianom.com/assets/master-ui-kit.css"),
    shiny::tags$script(src = "https://symbols-ui.obi.obianom.com/assets/master-ui-kit.js"),
    shiny::tags$script(src = "https://symbols-ui.obi.obianom.com/assets/mthlv.min.js")
  ),


  # Header: Insert header content using titlePanel ------------
  header = nextGenShinyApps::titlePanel(
    left = "Symbols and Equations Interface",
    right = nextGenShinyApps::actionButton("closeapp", "close", style = "pill", bg.type = "danger", size  = "xs")
  ),
  shiny::div(
    shiny::selectInput("symbolseqnuicopyinsert", "Copy or Insert When Clicked?", choices = c("Copy to Clipboard" = 1, "Insert in Document" = 2)),
    shiny::conditionalPanel(
      condition = "input.symbolseqnuicopyinsert == '2'",
      shiny::div(
        shiny::selectInput("symbolseqnuiinserttype", "Insert Type", choices = c("Rmd or Shiny: Insert Code"="a", "Rmd: Insert Code with R chunk"="b","Rmd: Insert Shorthand Code"="c")),
        class = "pl-2"
      )
    ),
    class = "d-flex align-middle"
  ),
  shiny::div(class="clipboardcopytextout text-success mb-2"),
  nextGenShinyApps::tabsetPanel(

    tab0,
    tab3,
    tab2,
    tab1,
    tab4,
    tab6,
    tab5,
    type = "pills",
    position = "right",
    justified = FALSE
  )
)) -> r2sym.ui
