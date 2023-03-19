#' Add symbol to current page
#'
#' Add selected symbol to page
#' @param symbolid the symbol id to include
#' @param type type of inclusion
#'
#' @return pastes copied symbol code into document
#'
#' @examples
#' insert.Symbol.Raw("sample copied")
#' insert.Symbol.Raw("rpkg.net","a")
#' @export
#'

insert.Symbol.Raw <- function(symbolid, type = letters[1:4]) {
  type <- match.arg(type)
  print(symbolid)
  switch(type,
    a = {
      symbolid <- paste0("sym(", symbolid, ")")
    },
    b = {
      symbolid <- paste0("`r sym(", symbolid, ")`")
    },
    c = {
      symbolid <- paste0("`", symbolid, "`")
    },
    d = {
      symbolid <- paste0("((", symbolid, "))")
    }
  )
  a <- rstudioapi::getSourceEditorContext()
  for (s in a$selection) {
    rstudioapi::insertText(location = s$range, text = sprintf("%s%s", s$text, symbolid))
  }
}



#' Paste items from clipboard
#'
#' Insert copied item from clipboard
#'
#' @return pastes copied items into current cursor position
#'
#' @examples
#' insert.copied()
#' @export
insert.copied <- function() {
  symbolid <- readClipboard(raw = F)
  rstudioapi::insertText(symbolid)
}





# tabs in the tabset
tab2 <- nextGenShinyApps::tabPanel("Equation", nextGenShinyApps::tabsetPanel(
  nextGenShinyApps::tabPanel(
    "MathLive", shiny::div(
      shiny::HTML('
                <math-field id="mathliveformula" class="border border-secondary" onkeyup="setaltlatext(this)" onload="setaltlatext(this)" style="display:inline-grid;border-width: 2px!important; padding:20px; min-width:100%">
</math-field>')
    ),
    shiny::tags$div(
      shiny::tags$button(id = "downloadbtn", class = "border-top-0 bg-blue-300 p-2 border-secondary", "download  equation"),
      shiny::tags$button(id = "converttolatex", class = "border-top-0 bg-blue-300 p-2 border-secondary", "convert to LaTeX"),
      class = "mb-3"
    ),
    shiny::tags$div(
      shiny::tags$input(id = "latextout", class = "border-secondary p-3", style = "display:inline-block; min-width:100%"),
      shiny::tags$div(
        shiny::tags$button(id = "converttoequ", class = "border-top-0 bg-blue-300 p-2 border-secondary", "convert to Equation"),
        shiny::tags$button(id = "copyttoequ2", class = "border-top-0 bg-blue-300 p-2 border-secondary", "copy to clipboard"),
        class = "mb-3"
      )
    )
  ),
  nextGenShinyApps::tabPanel("MathDox", shiny::div(
    shiny::tags$textarea(class = "mathdoxformula"),
    shiny::tags$button(id = "downloadbtn2", class = "border-top-0 bg-blue-300 p-2 border-secondary", "download  equation")
  )),
  type = "pills",
  justified = FALSE
))
tab3 <- nextGenShinyApps::tabPanel("Symbol", shiny::div(
  r2symbols::symCat(category = "symbol", font.color = "gray", font.weight = "light", font.size = 28)
))
tab4 <- nextGenShinyApps::tabPanel("Greek", shiny::div(
  r2symbols::symCat(category = "arrows", font.color = "gray", font.weight = "light", font.size = 28),
  r2symbols::symCat(category = "mixed", font.color = "gray", font.weight = "light", font.size = 28)
))
tab5 <- nextGenShinyApps::tabPanel("Arrow", shiny::div())
tab1 <- nextGenShinyApps::tabPanel("Emoji", shiny::div(
  r2symbols::symCat(category = "emoji", font.color = "gray", font.weight = "light", font.size = 26)
))
tab6 <- nextGenShinyApps::tabPanel("Smiley", shiny::div(
  r2symbols::symCat(category = "smiley", font.color = "gray", font.weight = "light", font.size = 28)
))
tab0 <- nextGenShinyApps::tabPanel("Home", shiny::div(
  # shiny::withMathJax(shiny::includeMarkdown(file.path(lib.loc(),"introduction.md")))
  shiny::withMathJax(shiny::includeMarkdown("https://symbols-ui.obi.obianom.com/assets/introduction.md"))
))
