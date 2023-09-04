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
mod_outer_module_server <- function(id){
  moduleServer(id, function(input, output, session) {
    data <- reactive({
      req(input$file)
      read.csv(input$file$datapath, header = TRUE)
    })

    output$contents <- renderTable({
      data()
    })
    mod_inner_module_server("inner_module", uploadedData = data())
  })
}

## To be copied in the UI
# mod_outer_module_ui("outer_module_1")

## To be copied in the server
# mod_outer_module_server("outer_module_1")
