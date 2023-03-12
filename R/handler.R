#' Add symbol to current page
#'
#' Add selected symbol to page
#' @param symbolid the symbol id to include
#' @param type type of inclusion
#'
#' @export
#'

insert.Symbol <- function(symbolid,type=letters[1:4]) {

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
  a <- rstudioapi::getSourceEditorContext()
  for (s in a$selection)
    rstudioapi::insertText(location = s$range, text = sprintf("%s%s", s$text, symbolid))
}
