#' Add symbol to current page
#'
#' Add selected symbol to page
#' @param symbolid the symbol id to include
#' @param type type of inclusion
#'
#' @export
#'

add.Symbol <- function(symbolid,type=c(1:4)) {
  a <- rstudioapi::getSourceEditorContext()
  s <- a$selection
  n <- length(s)

  type = match.arg(type)

  switch (type,
    1 = {
      symbolid <- paste0("sym(",symbolid,")")
    },
    2 = {
      symbolid <- paste0("symbol(",symbolid,")")
    },
    3 = {
      symbolid <- paste0("`",symbolid,"`")
    },
    4 = {
      symbolid <- paste0("((",symbolid,"))")
    }
  )
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
