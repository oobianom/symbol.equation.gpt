#' Main Widget Helper for symbols
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder
#'
#' @examples
#' \dontrun{
#' symbol.equation.ui()
#' }
#' @export
#'

(function() {
  # prior to starting app, clear console and environment
  cat("\014")
  rm(list = ls())
  closeAllConnections()

  # library calls
  env.init <- envir.prep()

  # declare viewer
  shiny::paneViewer(500) -> viewer

  # run the app
  shiny::runGadget(.symbol.equation.gpt.ui, r2sym.server, viewer = viewer)


}) -> symbol.equation.ui


#' Main Widget Helper for symbols viewer2
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder in modal
#'
#' @examples
#' \dontrun{
#' symbol.equation.ui2()
#' }
#' @export
#'

(function() {
  # prior to starting app, clear console and environment
  cat("\014")
  rm(list = ls())
  closeAllConnections()

  # library calls
  env.init <- envir.prep()

  # declare viewer
  shiny::dialogViewer(dialogName = "Symbols and Equations Builder",
                      width = 850,
                      height = 750) -> viewer

  # run the app
  shiny::runGadget(.symbol.equation.gpt.ui, r2sym.server, viewer = viewer)


}) -> symbol.equation.ui2
