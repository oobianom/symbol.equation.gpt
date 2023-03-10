#' UI
#'
#' Assembles UI
#'
#' @export
#'

r2sym.ui2 <- miniUI::miniPage(
  miniUI::gadgetTitleBar(shiny::HTML("r2symbols User Interface v1.01")),
  shiny::mainPanel(id='recent_panel_ui',
                   shiny::tags$style(shiny::HTML("
              #recent_panel_ui {padding-left:10px; padding-top:5px;min-width:400px;overflow-y: auto!important;}
              #recent_panel_ui button{border-width:0px;}
              .gadget-container, .tabbable{min-width:580px!important;}
              #recent_panel_ui{width:unset!important;min-height:700px!important;}
              ")),
    shiny::tabsetPanel(id="main_menu_tabs",
                       shiny::tabPanel("Recent", "tab_recent()",icon=shiny::icon("splotch")),
                       shiny::tabPanel("Files", "tab_files()",value="panel2", icon = shiny::icon("file")),
                       shiny::tabPanel("Create/Manage", "tab_setupmanage()",icon = shiny::icon("cogs")),
                       shiny::tabPanel("Writer", "tab_writer()",icon = shiny::icon("pen-square")),
                       shiny::tabPanel("Render", "tab_general()",icon = shiny::icon("shipping-fast")),
                       shiny::tabPanel("How to", "tab_howto()",icon = shiny::icon("question"))
    )
  ),
  miniUI::miniContentPanel(
    shiny::uiOutput("time")
      )
    )



#' UI2
#'
#' Assembles UI
#'
#' @export
#'
tab2 <- nextGenShinyApps::tabPanel("Equations", "Convallis aenean et tortor at risus. Enim neque volutpat ac tincidunt vitae semper quis lectus nulla. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc.")
tab3 <- nextGenShinyApps::tabPanel("Symbols", "Eu consequat ac felis donec et odio pellentesque. Egestas pretium aenean pharetra magna ac placerat. Eget velit aliquet sagittis id consectetur purus ut. Aliquet enim tortor at auctor urna nunc id cursus metus. Semper viverra nam libero justo laoreet sit amet.")
tab4 <- nextGenShinyApps::tabPanel("Greek Letters", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab5 <- nextGenShinyApps::tabPanel("Arrows", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab1 <- nextGenShinyApps::tabPanel("Emojis", "Vulputate mi sit amet mauris commodo quis. Dictum non consectetur a erat nam. Malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi. Aliquam faucibus purus in massa. Vel orci porta non pulvinar")
tab0 <- nextGenShinyApps::tabPanel("Home", shiny::div(
  nextGenShinyApps::actionButton("obi","hey",icon = shiny::icon("cog")),
  nextGenShinyApps::actionButton("obi2",r2symbols::sym(123),icon = shiny::icon("cog"))
))

r2sym.ui <- nextGenShinyApps::fluidPage(
  # Theme: Select color style from 1-13
  style = "6",

  custom.bg.color = "#f5f5f5",

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

