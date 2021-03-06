#' Capture Events
#' 
#' Enables capturing events in Shiny.
#' 
#' @inheritParams graph_nodes
#' 
#' @examples 
#' library(shiny)
#' 
#' graph_data <- make_data(1000)
#' 
#' ui <- fluidPage(
#'   graphOutput("g", height = "100vh")
#' )
#' 
#' server <- function(input, output) {
#'   output$g <- render_graph({
#'      graph(graph_data) %>% 
#'       capture_node_click()
#'   })
#' 
#'   observeEvent(input$g_node_click, {
#'     print(input$g_node_click)
#'   })
#' }
#' 
#' \dontrun{shinyApp(ui, server)}
#' 
#' @name graph_events
#' @export 
capture_node_click <- function(g) UseMethod("capture_node_click")

#' @export 
#' @method capture_node_click graph
capture_node_click.graph <- function(g) {
  g$x$on_node_click <- TRUE
  return(g)
}

#' @rdname graph_events
#' @export 
capture_node_double_click <- function(g) UseMethod("capture_node_double_click")

#' @export 
#' @method capture_node_double_click graph
capture_node_double_click.graph <- function(g) {
  g$x$on_node_double_click <- TRUE
  return(g)
}

#' @rdname graph_events
#' @export 
capture_node_hover <- function(g) UseMethod("capture_node_hover")

#' @export 
#' @method capture_node_hover graph
capture_node_hover.graph <- function(g) {
  g$x$on_node_hover <- TRUE
  return(g)
}