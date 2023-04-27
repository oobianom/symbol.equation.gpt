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




#' Check whether to install symbol.equation.gpt and install if necessary
#'
#' If the symbol.equation.gpt package is not installed, install it from GitLab using
#' remotes.
#' @export
check_symbol.equation.gpt <- function() {
  symbol.equation.gpt_version <- "0.2.1.9000"
  if (!requireNamespace("symbol.equation.gpt", quietly = TRUE)) {
    message("The symbol.equation.gpt package needs to be installed.")
    install_symbol.equation.gpt()
  } else if (utils::packageVersion("symbol.equation.gpt") < symbol.equation.gpt_version) {
    message("The symbol.equation.gpt package needs to be updated.")
    install_symbol.equation.gpt()
  }
}

#' Install the symbol.equation.gpt package after checking with the user
#' @export
install_symbol.equation.gpt <- function() {
  instructions <- paste("Please try installing the package for yourself",
                        "using the following command: \n",
                        "remotes::install_gitlab('dickoa/symbol.equation.gpt')")
                        #"install.packages(\"symbol.equation.gpt\")")

  error_func <- function(e) {
    stop(paste("Failed to install the symbol.equation.gpt package.\n", instructions))
  }

  input <- 1
  if (interactive()) {
    input <- utils::menu(c("Yes", "No"),
                         title = "Install the symbol.equation.gpt package?")
  }

  if (input == 1) {
    message("Installing the symbol.equation.gpt package.")
     tryCatch( remotes::install_gitlab("dickoa/symbol.equation.gpt"),
               error = error_func, warning = error_func)
  } else {
    stop(paste("The remotes and symbol.equation.gpt package are necessary for that method.\n",
               instructions))
  }

  # } else {
  #   stop(paste("Failed to install the symbol.equation.gpt package.\n", instructions))
  # }
}


