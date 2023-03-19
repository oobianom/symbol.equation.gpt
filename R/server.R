#' User Interface Server
#'
#' Assembles Server function for the user interface
#'
#' @param input function input
#' @param output function output
#' @param session app session
#'
#' @examples
#' \dontrun{
#' if(interactive()){
#' r2sym.server(input, output, session)
#' }
#' }
#'
#' @export
#'


(function(input, output, session) {
  # clear environment
  rm(list = setdiff(ls(), c("input", "output", "session")))


  shiny::observe({
    if (!is.null(input$transmittedSymbol0x)) {
      symidcomb <- strsplit(input$transmittedSymbol0x, "--")[[1]]
      symid <- as.numeric(symidcomb[1])

      if (symid > 0) {
        insert.Symbol.Raw(symid, type = symidcomb[2])
      }
    }
  },
  priority = 3)

  # app close button
  observeEvent(input$closeapp, {
    print("Symbols dashboard v1.2")
    shiny::stopApp()
  })

  # save inputs
  appid <- "symbolsui2"
  shinyStorePlus::setupStorage(appId = appid, inputs = TRUE)
}) -> r2sym.server
