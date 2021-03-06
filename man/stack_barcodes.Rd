% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stack_barcodes.R
\name{stack_barcodes}
\alias{stack_barcodes}
\title{Stack Barcodes}
\usage{
stack_barcodes(ID = ID, DOB = DOB, GENDER = GENDER, ADDRESS = ADDRESS, TYPE)
}
\arguments{
\item{ID}{A character string of participant ID}

\item{DOB}{A character string of Date-of Birth in the following format; \strong{DD/MM/YYYY}}

\item{GENDER}{A character of either M or F (for Male and Female respectively)}

\item{ADDRESS}{A character string with no white space which is used as the sample address}

\item{TYPE}{A character vector of any of the following options; FORM, LOG, FBC, CHEM21, VITD, GLUCOSE, HBA1C, INSULIN}
}
\description{
This use \code{magick} to arrange the barcodes into a single image and add the necessary text annotations.
}
\keyword{internal}
