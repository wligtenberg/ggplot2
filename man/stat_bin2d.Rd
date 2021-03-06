\name{stat_bin2d}
\alias{stat_bin2d}
\title{Count number of observation in rectangular bins.}
\usage{
  stat_bin2d(mapping = NULL, data = NULL, geom = NULL,
    position = "identity", bins = 30, drop = TRUE, ...)
}
\description{
  Count number of observation in rectangular bins.
}
\examples{
d <- ggplot(diamonds, aes(carat, price))
d + stat_bin2d()
d + geom_bin2d()

# You can control the size of the bins by specifying the number of
# bins in each direction:
d + stat_bin2d(bins = 10)
d + stat_bin2d(bins = 30)

# Or by specifying the width of the bins
d + stat_bin2d(binwidth = c(1, 1000))
d + stat_bin2d(binwidth = c(.1, 500))

# Or with a list of breaks
x <- seq(min(diamonds$carat), max(diamonds$carat), by = 0.1)
y <- seq(min(diamonds$price), max(diamonds$price), length = 50)
d + stat_bin2d(breaks = list(x = x, y = y))

# With qplot
qplot(x, y, data = diamonds, geom="bin2d",
  xlim = c(4, 10), ylim = c(4, 10))
qplot(x, y, data = diamonds, geom="bin2d", binwidth = c(0.1, 0.1),
  xlim = c(4, 10), ylim = c(4, 10))
}
\seealso{
  \code{\link{stat_binhex}} for hexagonal binning
}

