#' Server
#'
#' Assembles Server
#'
#' @export
#'


(function(input, output, session) {

  # clear environment
  rm(list = setdiff(ls(), c("input", "output", "session")))


  shiny::observe({
    if (!is.null(input$transmittedSymbol0x)) {
print(input$transmittedSymbol0x)
      print("------")
      symidcomb <- strsplit(input$transmittedSymbol0x,"--")[[1]]
      print(symidcomb)
      symid <- as.numeric(symidcomb[1])

      if(symid > 0){
        insert.Symbol.Raw(symid,type = symidcomb[2])
      }

    }

    }, priority = 3)

  observeEvent(input$closeapp,{
    print("Symbols dashboard v1.2")
    shiny::stopApp()

  })

  # Include all the libraries and clear the console
  cat("\014")


}) -> r2sym.server



