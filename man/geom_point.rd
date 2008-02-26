\name{GeomPoint}
\alias{geom_point}
\alias{GeomPoint}
\title{geom_point}
\description{Points, as for a scatterplot}
\details{
The point geom is used to create scatterplots.

This page describes \code{\link{geom_point}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_point.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_point(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{shape}: shape of point 
  \item \code{colour}: border colour 
  \item \code{size}: size 
}
}
\section{Advice}{
The scatterplot is useful for displaying the relationship between two continuous variables, although it can also be used with one continuous and one categorical variable, or two categorical variables.  See \code{\link{geom_jitter}} for possibilities.

The \emph{bubblechart} is a scatterplot with a third variable mapped to the size of points.  There are no special names for scatterplots where another variable is mapped to point shape or colour, however.

The biggest potential problem with a scatterplot is overplotting: whenever you have more than a few points, points may be plotted on top of one another.  This can severely distort the visual appearance of the plot.  There is no one solution to this problem, but there are some techniques that can help.  You can add additional information with \code{\link{stat_smooth}}, \code{\link{stat_quantile}} or stat_density2d.  If you have few unique x values, \code{\link{geom_boxplot}} may also be useful.  Alternatively, you can summarise the number of points at each location and display that in some way, using \code{\link{stat_sum}}.  Another technique is to use transparent points, \code{geom_point(colour=alpha('black', 0.05))}

}
\usage{geom_point(mapping=NULL, data=NULL, stat="identity", position="identity", ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{scale_area}}: Scale area of points, instead of radius
  \item \code{\link{geom_jitter}}: Jittered points for categorical data
  \item \url{http://had.co.nz/ggplot/geom_point.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- ggplot(mtcars, aes(x=wt, y=mpg))
    p + geom_point()

    # Add aesthetic mappings
    p + geom_point(aes(colour=qsec))
    p + geom_point(aes(colour=cyl))
    p + geom_point(aes(colour=factor(cyl)))
    p + geom_point(aes(shape=factor(cyl)))
    p + geom_point(aes(size=qsec))

    # Change scales
    p + geom_point(aes(colour=cyl)) + scale_colour_gradient(low="red")
    p + geom_point(aes(size=qsec)) + scale_area()
    p + geom_point(aes(shape=factor(cyl))) + scale_shape(solid=FALSE)
    
    # Set aesthetics to fixed value
    p + geom_point(colour = "red", size=3)
        
    # Use qplot instead
    qplot(x=wt, y=mpg, data=mtcars)
    qplot(x=wt, y=mpg, data=mtcars, geom="point")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}