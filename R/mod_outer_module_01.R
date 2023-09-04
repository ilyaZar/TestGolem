#' outer_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_outer_module_ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    h1("Outer Module"),
    fileInput(ns("file"), "Choose a CSV file", accept = ".csv"),
    tableOutput(ns("contents")),
    mod_inner_module_ui(ns("inner_module"))
  )
}

#' outer_module Server Functions
#'
#' @noRd
mod_outer_module_server <- function(id, global){
  moduleServer(id, function(input, output, session) {
    observe({
      req(input$file)
      global$Data <- read.csv(input$file$datapath, header = TRUE)
    })

    output$contents <- renderTable({
      global$Data
    })
    mod_inner_module_server("inner_module",  global$Data, global = global)
  })
}

## To be copied in the UI
# mod_outer_module_ui("outer_module_1")

## To be copied in the server
# mod_outer_module_server("outer_module_1")
