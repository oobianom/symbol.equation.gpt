#' Server
#'
#' Assembles Server
#'
#' @export
#'


r2sym.server <- function(input, output, session) {

  # clear environment
  rm(list = setdiff(ls(), c("input", "output", "session")))

  observeEvent(input$obi2,{
    print(r2symbols::sym(500))
  })




  shiny::observe({
    if (!is.null(input$transmittedSymbol0x)) {

      print(input$transmittedSymbol0x)

    }

    }, priority = 3)


  shiny::observe({
    a <- rstudioapi::getSourceEditorContext()
    s <- a$selection
    print(s)
  })

  observeEvent(input$closeapp,{
    print("Symbols dashboard v1.2")
    shiny::stopApp()

  })

  # Include all the libraries and clear the console
  cat("\014")


}



