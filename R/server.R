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

    })



  observeEvent(input$closeapp,{
    print("Symbols dashboard v1.2")
    shiny::stopApp()

  })

  # Include all the libraries and clear the console
  cat("\014")


}



#' Add symbol to current page
#'
#' Add selected symbol to page
#'
#' @export
#'

add.Symbol <- function(symbolid) {
  a <- rstudioapi::getSourceEditorContext()
  s <- a$selection
  n <- length(s)
  # if no text is selected
  if (n == 1L && nchar(s[[1L]]$text) == 0L) {
    pos <- s[[1L]]$range$start
    pos[2L] <- 1
    rstudioapi::insertText(location = pos, text = symbolid)
  } else {
    for (i in s)
      rstudioapi::insertText(location = i$range$start, text = symbolid)
  }
}
