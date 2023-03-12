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
  require(symbols.equations.ui, quietly = TRUE)
  require(nextGenShinyApps, quietly = TRUE)
  require(r2symbols, quietly = TRUE)

  # declare viewer
  viewer <- shiny::paneViewer(500)

  # run the app
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}) -> UI


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
  require(symbols.equations.ui, quietly = TRUE)
  require(nextGenShinyApps, quietly = TRUE)
  require(r2symbols, quietly = TRUE)

  # declare viewer
  viewer <- shiny::dialogViewer(dialogName = "Symbols and Equations Builder", width = 700)

  # run the app
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}) -> UI2
