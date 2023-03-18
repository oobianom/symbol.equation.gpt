#' Main Widget Helper for symbols
#'
#' Assembles the interface for the symbols builder
#'
#' @export
#'

(function(){

  # prior to starting app, clear console and environment
  cat("\014")
  rm(list=ls())
  closeAllConnections()

  # library calls
  require(shiny, quietly = TRUE)
  require(symbol.equation.ui, quietly = TRUE)
  require(nextGenShinyApps, quietly = TRUE)
  require(r2symbols, quietly = TRUE)
  require(shinyStorePlus, quietly = TRUE)

  # declare viewer
  shiny::paneViewer(500) -> viewer

  # run the app
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}) -> symbol.equation.UI


#' Main Widget Helper for symbols viewer2
#'
#' Assembles the interface for the symbols builder
#'
#' @export
#'

(function(){

  # prior to starting app, clear console and environment
  cat("\014")
  rm(list=ls())
  closeAllConnections()

  # library calls
  require(shiny, quietly = TRUE)
  require(symbol.equation.ui, quietly = TRUE)
  require(nextGenShinyApps, quietly = TRUE)
  require(r2symbols, quietly = TRUE)
  require(shinyStorePlus, quietly = TRUE)

  # declare viewer
  shiny::dialogViewer(dialogName = "Symbols and Equations Builder", width = 850, height = 750) -> viewer

  # run the app
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}) -> symbol.equation.UI2
