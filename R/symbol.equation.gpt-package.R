#' symbol.equation.gpt
#'
#' @name symbol.equation.gpt
#' @docType package
#' @import utils
#' @import shiny
#' @import r2symbols
#' @import shinyStorePlus
#' @noRd
#' @keywords internal
"_PACKAGE"

.onLoad <- function(libname,pkgname){
  utils::globalVariables(paste0(".",pkgname,".",c("ui","server")))
}
