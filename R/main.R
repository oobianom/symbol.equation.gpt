#' Main Widget Helper for symbols
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder
#'
#' @examples
#' if(interactive()){
#' symbol.equation.ui()
#' }
#' @export
#'

(function() {

  # run the app
  equationSymbol.Widget(viewer = "pane")


}) -> symbol.equation.ui


#' Main Widget Helper for symbols viewer2
#'
#' Assembles the interface for the symbols builder
#'
#' @return user interface for the builder in modal
#'
#' @examples
#' if(interactive()){
#' symbol.equation.ui2()
#' }
#' @export
#'

(function() {

  # run the app
  equationSymbol.Widget(viewer = "dialog")


}) -> symbol.equation.ui2


#' Primary widget container
#'
#' Customizable widget opener
#'
#' @param viewer viewer option to open widget
#'
#' @return shiny app widget
#'
#' @examples
#' if(interactive()){
#' equationSymbol.Widget()
#' }
#'
#' @export
#'

(function(viewer = c("pane","dialog")) {
  print("rendering...")
  # library calls
  env.init <- envir.prep()

  # load required
  load(file = file.path(env.init,"req_pack.ob"))
 shiny::shinyApp(.symbol.equation.gpt.ui, .symbol.equation.gpt.server)

}) -> equationSymbol.Widget

