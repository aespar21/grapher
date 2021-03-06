globalVariables(
  c(
    "source", "target", "nodes", "edges",
    "Depends", "Imports", "LinkingTo", "Package",
    "activate", "from", "id.x", "id.y", "name", "tg_id", "to",
    "x.source", "y.source", "z.source", "x.target", "y.target", "z.target",
    "distance", "x", "y", "z", "hidden", "fromColor", "toColor",
    "value"
  )
)

scale_colour <- function(x, palette){
  if(inherits(x, "numeric"))
    scales::col_numeric(palette, range(x), na.color = "#FFFFFF")
  else
    scales::col_factor(palette, unique(x), na.color = "#FFFFFF")
}

.prepare_graph <- function(x, n, nms){
  if(is.null(x))
    return(NULL)

  if(!ncol(x))
    return(NULL)

  names <- names(x)
  names[n] <- nms
  names(x) <- names
  return(x)
}

.get_default_style <- function(object, var, style){
  nms <- names(object)
  if(var %in% nms && !is.null(style[[style]]))
    return(var)
  return(NULL)
}

.compute_dist <- function(x.source, y.source, z.source, x.target, y.target, z.target){
  x <- (x.source - x.target)^2
  y <- (y.source - y.target)^2
  z <- (z.source - z.target)^2
  sqrt(x + y + z)
}

to_hex <- function(x){
  rgb(t(col2rgb(x, alpha = FALSE)/255))
}

scale_rgb <- function(x, y, z, r, g, b) {
  x <- scales::rescale(x, to = r)
  y <- scales::rescale(y, to = g)
  z <- scales::rescale(z, to = b)
  rgb(x, y, z)
}

.get_domain <- function(nodes){
  rngx <- range(nodes$x)
  rngy <- range(nodes$y)
  rngz <- range(nodes$z)

  mn <- min(rngx[1], rngy[1], rngz[1])
  mx <- max(rngx[2], rngy[2], rngz[2])

  c(mn, mx)
}