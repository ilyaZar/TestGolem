#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  # data <- shiny::reactiveVal({mtcars})
  global <- reactiveValues(
    Data = NULL
  )
  mod_outer_module_server("outer_module", global = global)
}
