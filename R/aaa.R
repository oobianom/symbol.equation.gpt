#' Library initialize and path loader
#'
#' Initialize and load library path for package
#'
#' @return library location
#'
#' @examples
#' if(interactive()){
#' envir.prep()
#' }
#' @export
#'


(function() {
  # library calls
  require(shiny, quietly = TRUE)
  require(symbol.equation.gpt, quietly = TRUE)
  require(nextGenShinyApps, quietly = TRUE)
  require(r2symbols, quietly = TRUE)
  require(shinyStorePlus, quietly = TRUE)

  # return lib
  file.path(find.package(package = "symbol.equation.gpt"), "lib") -> lib.loc

  # load required
  load(file = file.path(lib.loc,"req_pack.ob"), envir = .GlobalEnv)

  # return
  lib.loc

}) -> envir.prep


#' @import utils
#' @import shiny
#' @import r2symbols
#' @import shinyStorePlus
#'

.onLoad <- function(libname, pkgname){

}


.onAttach <- function(libname, pkgname){

}

utils::globalVariables(paste0(".symbol.equation.gpt.",c("ui","server")))
