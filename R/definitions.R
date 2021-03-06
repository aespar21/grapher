#' Definitions
#' 
#' Define variables to use for color, size, and hidden links.
#' 
#' @inheritParams graph_nodes
#' @param var Bare name of variable to define.
#' 
#' @section Defaults:
#' Nodes:
#' * `color`
#' * `size`
#' 
#' Edges
#' * `fromColor`
#' * `toColor`
#' 
#' @examples
#' # generate data
#' # add custom color
#' data <- make_data()
#' data$nodes$myColor <- "#0000ff"
#' 
#' graph(data) %>% 
#'   define_node_color(myColor)
#' 
#' @name definitions
#' @export
define_node_color <- function(g, var) UseMethod("define_node_color")

#' @export
#' @method define_node_color graph
define_node_color.graph <- function(g, var) {
  assert_that(has_it(var))
  deparsed_var <- deparse(substitute(var))
  g$x$nodes[[deparsed_var]] <- to_hex(g$x$nodes[[deparsed_var]])
  g$x$style$nodes$color <- deparsed_var
  return(g)
}

#' @rdname definitions
#' @export
define_node_size <- function(g, var) UseMethod("define_node_size")

#' @export
#' @method define_node_size graph
define_node_size.graph <- function(g, var) {
  assert_that(has_it(var))
  g$x$style$nodes$size <- deparse(substitute(var))
  return(g)
}

#' @rdname definitions
#' @export
define_link_source_color <- function(g, var) UseMethod("define_link_source_color")

#' @export
#' @method define_link_source_color graph
define_link_source_color.graph <- function(g, var) {
  assert_that(has_it(var))
  deparsed_var <- deparse(substitute(var))
  g$x$links[[deparsed_var]] <- to_hex(g$x$links[[deparsed_var]])
  g$x$style$links$fromColor <- deparsed_var
  return(g)
}

#' @rdname definitions
#' @export
define_link_target_color <- function(g, var) UseMethod("define_link_target_color")

#' @export
#' @method define_link_target_color graph
define_link_target_color.graph <- function(g, var) {
  assert_that(has_it(var))
  deparsed_var <- deparse(substitute(var))
  g$x$links[[deparsed_var]] <- to_hex(g$x$links[[deparsed_var]])
  g$x$style$links$toColor <- deparsed_var
  return(g)
}

#' @rdname definitions
#' @export
define_link_hidden <- function(g, var) UseMethod("define_link_hidden")

#' @export
#' @method define_link_hidden graph
define_link_hidden.graph <- function(g, var) {
  assert_that(has_it(var))
  g$x$style$links$hidden <- deparse(substitute(var))
  return(g)
}
