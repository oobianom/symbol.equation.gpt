#' Add symbol to current page
#'
#' Add selected symbol to page
#' @param symbolid the symbol id to include
#'
#' @export
#'

add.Symbol <- function(symbolid,type=c(1:3)) {
  a <- rstudioapi::getSourceEditorContext()
  s <- a$selection
  n <- length(s)
  add.Symbol <- paste0("sym(",add.Symbol,")")
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
