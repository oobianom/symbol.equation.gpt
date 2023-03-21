#' Main Widget Helper for symbols
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder
#'
#' @examples
#' if(interactive()){
#' symbol.equation.ui()
#' }
#' @export
#'

(function() {
  # prior to starting app, close open connections
  closeAllConnections()

  # library calls
  env.init <- envir.prep()

  # load required
  load(file = file.path(env.init,"req_pack.ob"))


  # declare viewer
  shiny::paneViewer(500) -> viewer

  # run the app
  shiny::runGadget(.symbol.equation.gpt.ui, .symbol.equation.gpt.server, viewer = viewer)


}) -> symbol.equation.ui


#' Main Widget Helper for symbols viewer2
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder in modal
#'
#' @examples
#' if(interactive()){
#' symbol.equation.ui2()
#' }
#' @export
#'

(function() {
  # prior to starting app, close open connections
  closeAllConnections()

  # library calls
  env.init <- envir.prep()

  # load required
  load(file = file.path(env.init,"req_pack.ob"))

  # declare viewer
  shiny::dialogViewer(dialogName = "Symbols and Equations Builder",
                      width = 850,
                      height = 750) -> viewer

  # run the app
  shiny::runGadget(.symbol.equation.gpt.ui, .symbol.equation.gpt.server, viewer = viewer)


}) -> symbol.equation.ui2




(function(input, output, session) {
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
    shiny::stopApp()
  })

  # save inputs
  appid <- "rpkgsymbolsui255"
  shinyStorePlus::setupStorage(appId = appid, inputs = TRUE)
}) -> .symbol.equation.gpt.server
