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
  # return lib
  file.path(find.package(package = "symbol.equation.gpt"), "lib") -> lib.loc

  # return
  lib.loc

}) -> envir.prep





