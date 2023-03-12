#' Server
#'
#' Assembles Server
#'
#' @export
#'


r2sym.server <- function(input, output, session) {

  # clear environment
  rm(list = setdiff(ls(), c("input", "output", "session")))


  shiny::observe({
    if (!is.null(input$transmittedSymbol0x)) {

      symid <- as.numeric(input$transmittedSymbol0x)

      if(symid > 0){
        insert.Symbol.Raw(symid,type = "a")
      }

    }

    }, priority = 3)

  observeEvent(input$closeapp,{
    print("Symbols dashboard v1.2")
    shiny::stopApp()

  })

  # Include all the libraries and clear the console
  cat("\014")


}



