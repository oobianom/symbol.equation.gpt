#' Add symbol to current page
#'
#' Add selected symbol to page
#' @param symbolid the symbol id to include
#' @param type type of inclusion
#'
#' @export
#'

insert.Symbol <- function(symbolid,type=letters[1:4]) {
  a <- rstudioapi::getSourceEditorContext()
  s <- a$selection
  n <- length(s)

  type = match.arg(type)

  switch (type,
    a = {
      symbolid <- paste0("sym(",symbolid,")")
    },
    b = {
      symbolid <- paste0("symbol(",symbolid,")")
    },
    c = {
      symbolid <- paste0("`",symbolid,"`")
    },
    d = {
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
