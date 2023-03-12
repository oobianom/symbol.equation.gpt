#' Main Widget Helper for symbols
#'
#' Assembles the interface for the symbols builder
#'
#' @export
#'

UI <- function(){

  #Prior to starting app, clear console and environment
  cat("\014")
  rm(list=ls())
  closeAllConnections()

  library("r2symbols.ui")
  library(nextGenShinyApps)

  # We'll use a pane viewer, and set the minimum height at
  # 500px to ensure we get enough screen space to display everything.
  viewer <- shiny::paneViewer(500)
  #run the app, ensure the viewer is that which is shown inside rstudio
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}


#' Main Widget Helper for symbols viewer2
#'
#' Assembles the interface for the symbols builder
#'
#' @export
#'

UI2 <- function(){

  #Prior to starting app, clear console and environment
  cat("\014")
  rm(list=ls())
  closeAllConnections()

  library(symbols.equations.ui)
  library(nextGenShinyApps)

  # We'll use a pane viewer, and set the minimum height at
  # 500px to ensure we get enough screen space to display everything.
  viewer <- shiny::dialogViewer(dialogName = "Symbols Builder", width = 700)
  #run the app, ensure the viewer is that which is shown inside rstudio
  shiny::runGadget(r2sym.ui, r2sym.server, viewer = viewer)


}
