% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_ilo.R
\name{theme_ilo}
\alias{theme_ilo}
\title{One ggplot theme}
\usage{
theme_ilo()
}
\value{
The function to use \code{+} in the ggplot workflow.
}
\description{
One ggplot theme
}
\examples{
datasets::mtcars \%>\%
  ggplot2::ggplot(ggplot2::aes(mpg, disp)) +
  ggplot2::geom_point() +
  theme_ilo()
}
