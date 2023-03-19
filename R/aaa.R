#' Library initialize and path loader
#'
#' Initialize and load library path for package
#'
#' @return library location
#'
#' @examples
#' envir.prep()
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
  file.path(find.package(package = "symbol.equation.gpt"), "lib")
}) -> envir.prep



