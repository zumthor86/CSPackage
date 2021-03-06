% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_read.R
\name{fars_read}
\alias{fars_read}
\title{Read FARS csv data}
\usage{
fars_read(filename)
}
\arguments{
\item{filename}{A character vector specifiying the FARS csv file in the current working directory to read}
}
\value{
A tibble containing the FARS data
}
\description{
Read FARS csv data
}
\note{
Gives an error if filename that is passed doesn't exist in current working directory
}
\examples{
\dontrun{
fars_read("accident_2013.csv.bz2")
}


}
