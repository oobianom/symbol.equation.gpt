#' Add symbol to current page
#'
#' Add selected symbol to page
#'
#' @export
#'

add.Symbol <- function(symbolid) {
  a <- rstudioapi::getSourceEditorContext()
  s <- a$selection
  n <- length(s)
  # if no text is selected
  if (n == 1L && nchar(s[[1L]]$text) == 0L) {
    pos <- s[[1L]]$range$start
    pos[2L] <- 1
    rstudioapi::insertText(location = pos, text = symbolid)
  } else {
    for (i in s)
      rstudioapi::insertText(location = i$range$start, text = symbolid)
  }
}
