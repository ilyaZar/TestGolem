#' out_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_inner_module_ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    h1("Inner Module"),
    selectInput(inputId = ns("colName"),
                label = "Select a column name",
                choices = NULL,
                selected = NULL
    )
  )
}

#' out_module Server Functions
#'
#' @noRd
mod_inner_module_server <- function(id, uploadedData){
  moduleServer(id, function(input, output, session) {
    observeEvent(uploadedData, {
      updateSelectInput(session = session,
                        inputId = "colName",
                        choices = names(uploadedData),
                        selected = names(uploadedData)[1]
      )
    })
  })
}

## To be copied in the UI
# mod_out_module_ui("out_module_1")

## To be copied in the server
# mod_out_module_server("out_module_1")
