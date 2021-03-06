#' Hollow bar with middle indicated by horizontal line.
#'
#' @inheritParams geom_point
#' @param fatten a multiplicate factor to fatten middle bar by
#' @seealso \code{\link{geom_errorbar}} for error bars,
#' \code{\link{geom_pointrange}} and \code{\link{geom_linerange}} for other
#' ways of showing mean + error, \code{\link{stat_summary}} to compute
#' errors from the data, \code{\link{geom_smooth}} for the continuous analog.
#' @export
#' @examples
#' # See geom_linerange for examples
geom_crossbar <- function (mapping = NULL, data = NULL, stat = "identity", position = "identity", 
fatten = 2, ...) { 
  GeomCrossbar$new(mapping = mapping, data = data, stat = stat, 
  position = position, fatten = fatten, ...)
}

GeomCrossbar <- proto(Geom, {
  objname <- "crossbar"

  icon <- function(.) {
    gTree(children=gList(
      rectGrob(c(0.3, 0.7), c(0.6, 0.8), width=0.3, height=c(0.4, 0.4), vjust=1),
      segmentsGrob(c(0.15, 0.55), c(0.5, 0.6), c(0.45, 0.85), c(0.5, 0.6))
    ))
  }
  
  reparameterise <- function(., df, params) {
    GeomErrorbar$reparameterise(df, params)
  }

  default_stat <- function(.) StatIdentity
  default_pos <- function(.) PositionIdentity
  default_aes = function(.) aes(colour="black", fill=NA, size=0.5, linetype=1, alpha = 1)
  required_aes <- c("x", "y", "ymin", "ymax")
  guide_geom <- function(.) "path"
  
  draw <- function(., data, scales, coordinates, fatten = 2, width = NULL, ...) {
    middle <- transform(data, x = xmin, xend = xmax, yend = y, size = size * fatten)

    # If there's a notch
    if (!is.na(data$ynotchlower) && !is.na(data$ynotchupper)) {
      if (data$ynotchlower < data$ymin  ||  data$ynotchupper > data$ymax)
        warning("notch went outside hinges. Try setting notch=FALSE.")

      notchindent <- (1 - data$notchwidth) * (data$xmax - data$xmin) / 2

      middle$x <- middle$x + notchindent
      middle$xend <- middle$xend - notchindent

      box <- data.frame(
              x = c(data$xmin, data$xmin, data$xmin + notchindent, data$xmin, data$xmin,
                    data$xmax, data$xmax, data$xmax - notchindent, data$xmax, data$xmax,
                    data$xmin),
              y = c(data$ymax, data$ynotchupper, data$y, data$ynotchlower, data$ymin,
                    data$ymin, data$ynotchlower, data$y, data$ynotchupper, data$ymax,
                    data$ymax),
              alpha = data$alpha, colour = data$colour, size = data$size,
              linetype = data$linetype, fill = data$fill, group = data$group,
              stringsAsFactors = FALSE)

    } else {
      # No notch
      box <- data.frame(
              x = c(data$xmin, data$xmin, data$xmax, data$xmax, data$xmin),
              y = c(data$ymax, data$ymin, data$ymin, data$ymax, data$ymax),
              alpha = data$alpha, colour = data$colour, size = data$size,
              linetype = data$linetype, fill = data$fill, group = data$group,
              stringsAsFactors = FALSE)
    }

    ggname(.$my_name(), gTree(children=gList(
      GeomPolygon$draw(box, scales, coordinates, ...),
      GeomSegment$draw(middle, scales, coordinates, ...)
    )))
  }
})
