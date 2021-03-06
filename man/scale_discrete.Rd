\name{scale_x_discrete}
\alias{scale_x_discrete}
\alias{scale_y_discrete}
\title{Discrete position.}
\usage{
  scale_x_discrete(..., expand = c(0, 0.6))

  scale_y_discrete(..., expand = c(0, 0.6))
}
\description{
  You can use continuous positions even with a discrete
  position scale - this allows you (e.g.) to place labels
  between bars in a bar chart. Continuous positions are
  numeric values starting at one for the first level, and
  increasing by one for each level (i.e. the labels are
  placed at integer positions).  This is what allows
  jittering to work.
}
\examples{
qplot(cut, data=diamonds, stat="bin")
qplot(cut, data=diamonds, geom="bar")

# The discrete position scale is added automatically whenever you
# have a discrete position.

(d <- qplot(cut, clarity, data=subset(diamonds, carat > 1), geom="jitter"))

d + scale_x_discrete("Cut")
d + scale_x_discrete("Cut", labels = c("Fair" = "F","Good" = "G",
  "Very Good" = "VG","Perfect" = "P","Ideal" = "I"))

d + scale_y_discrete("Clarity")
d + scale_x_discrete("Cut") + scale_y_discrete("Clarity")

# Use limits to adjust the which levels (and in what order)
# are displayed
d + scale_x_discrete(limits=c("Fair","Ideal"))

# you can also use the short hand functions xlim and ylim
d + xlim("Fair","Ideal", "Good")
d + ylim("I1", "IF")

# See ?reorder to reorder based on the values of another variable
qplot(manufacturer, cty, data=mpg)
qplot(reorder(manufacturer, cty), cty, data=mpg)
qplot(reorder(manufacturer, displ), cty, data=mpg)

# Use abbreviate as a formatter to reduce long names
qplot(reorder(manufacturer, cty), cty, data=mpg) +
  scale_x_discrete(labels = abbreviate)
}
\seealso{
  Other position scales: \code{\link{scale_x_continuous}},
  \code{\link{scale_x_date}},
  \code{\link{scale_x_datetime}},
  \code{\link{scale_x_log10}},
  \code{\link{scale_x_reverse}},
  \code{\link{scale_x_sqrt}},
  \code{\link{scale_y_continuous}},
  \code{\link{scale_y_date}},
  \code{\link{scale_y_datetime}},
  \code{\link{scale_y_log10}},
  \code{\link{scale_y_reverse}}, \code{\link{scale_y_sqrt}}
}

