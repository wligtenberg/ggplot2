\name{stat_quantile}
\alias{stat_quantile}
\title{Continuous quantiles.}
\usage{
  stat_quantile(mapping = NULL, data = NULL,
    geom = "quantile", position = "identity",
    quantiles = c(0.25, 0.5, 0.75), formula = y ~ x,
    method = "rq", na.rm = FALSE, ...)
}
\arguments{
  \item{quantiles}{conditional quantiles of y to calculate
  and display}

  \item{formula}{formula relating y variables to x
  variables}

  \item{xseq}{exact points to evaluate smooth at, overrides
  n}
}
\value{
  a data.frame with additional columns:
  \item{quantile}{quantile of distribution}
}
\description{
  Continuous quantiles.
}
\examples{
msamp <- movies[sample(nrow(movies), 1000), ]
m <- ggplot(msamp, aes(y=rating, x=year)) + geom_point()
m + stat_quantile()
m + stat_quantile(quantiles = 0.5)
m + stat_quantile(quantiles = seq(0.1, 0.9, by=0.1))

# Doesn't work.  Not sure why.
# m + stat_quantile(method = rqss, formula = y ~ qss(x), quantiles = 0.5)

# Add aesthetic mappings
m + stat_quantile(aes(weight=votes))

# Change scale
m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05))
m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05)) +
  scale_colour_gradient2(midpoint=0.5, low="green", mid="yellow", high="green")

# Set aesthetics to fixed value
m + stat_quantile(colour="red", size=2, linetype=2)

# Use qplot instead
qplot(year, rating, data=movies, geom="quantile")
}

