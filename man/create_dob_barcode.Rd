% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_dob_barcode.R
\name{create_dob_barcode}
\alias{create_dob_barcode}
\title{Create Date-of-Birth (DOB) Barcode}
\usage{
create_dob_barcode(DOB)
}
\arguments{
\item{DOB}{A character string of Date-of Birth in the following format; \strong{DD/MM/YYYY}}
}
\description{
This functions invokes a system command to \code{Zint} and outputs a \strong{Code 128} barcode.
}
\details{
Barcodes are saved to the directory which has been created using \code{create_directory}.
}
