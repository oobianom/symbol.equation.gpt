#' UI
#'
#' Assembles UI cat("\U02611 downloaded")
#'
#' @export
#'
tab2 <- nextGenShinyApps::tabPanel("Equations", "Convallis aenean et tortor at risus. Enim neque volutpat ac tincidunt vitae semper quis lectus nulla. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc.")
tab3 <- nextGenShinyApps::tabPanel("Symbols", "Eu consequat ac felis donec et odio pellentesque. Egestas pretium aenean pharetra magna ac placerat. Eget velit aliquet sagittis id consectetur purus ut. Aliquet enim tortor at auctor urna nunc id cursus metus. Semper viverra nam libero justo laoreet sit amet.")
tab4 <- nextGenShinyApps::tabPanel("Greek Letters", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab5 <- nextGenShinyApps::tabPanel("Arrows", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab1 <- nextGenShinyApps::tabPanel("Emojis", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab0 <- nextGenShinyApps::tabPanel("Home", shiny::div(
  r2symbols::symCat(category = "smiley", font.color="gray", font.weight = "light",font.size = 32),
  nextGenShinyApps::actionButton("obi","hey",icon = shiny::icon("cog")),
  nextGenShinyApps::actionButton("obi2",r2symbols::sym(123),icon = shiny::icon("cog"))
))

r2sym.ui <- nextGenShinyApps::fluidPage(
  # Theme: Select color style from 1-13
  style = "6",

  custom.bg.color = "#f5f5f5",

  shiny::tags$style(shiny::HTML("
              #recent_panel_ui {padding-left:10px; padding-top:5px;min-width:400px;overflow-y: auto!important;}
              #recent_panel_ui button{border-width:0px;}
              .gadget-container, .tabbable{min-width:580px!important;}
              #recent_panel_ui{width:unset!important;min-height:700px!important;}
              .r2rsymbols-sym{cursor:pointer}
              ")),
  shiny::tags$script(shiny::HTML("
              alert('bam')
              ")),


  # Header: Insert header content using titlePanel ------------
  header = nextGenShinyApps::titlePanel(
    left = "Symbols Interface",
    right = nextGenShinyApps::actionButton("closeapp","",icon = shiny::icon("window-close"),style="pill",bg.type = "primary")),

  nextGenShinyApps::tabsetPanel(
    tab0,
    tab1,
    tab2,
    tab3,
    tab4,
    tab5,
    type = "pills",
    justified = TRUE
  )
)

