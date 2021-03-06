---
id: graph_layout_stable
title: Graph Layout Stable
sidebar_label: Graph Layout Stable
---

## Description

Stabilize the layout of the graph.


## Usage

```r
graph_stable_layout(g, stable = TRUE, ms = 0L)
graph_layout_stable(g, stable = TRUE, ms = 0L)
```


## Arguments

Argument      |Description
------------- |----------------
`g`     |     An object of class `graph` as returned by [`graph`](#graph) or a `graph_proxy`  as returned by a function of the same name.
`stable`     |     Whether to stabilise the graph.
`ms`     |     Milliseconds before stabilizing the graph.


## Examples

```r
gdata <- make_data(100)

graph(gdata) %>%
graph_layout_stable(ms = 5000)

# as proxy
library(shiny)

graph_data <- make_data(200)

ui <- fluidPage(
actionButton("stable", "stabilize"),
graphOutput("g")
)

server <- function(input, output){
output$g <- renderGraph({
graph(graph_data) %>%
graph_layout_live(time_step = 1)
})

gp <- graph_proxy("g")

observeEvent(input$stable, {
graph_stable_layout(gp)
})
}

shinyApp(ui, server)
```


