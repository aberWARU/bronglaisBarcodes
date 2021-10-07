#' Centre Barcode Text
#'
#' Create the location coordinates to ensure bar code text is centred when using `magick::image_annotate` in `stack_barcodes`
#'
#' @param x a character string of the bar code label
#' @return a character string of the formatted location values (ie, '+80+35)
#'
#' @keywords internal

text_location <- function(x)
{
  if (nchar(x) < 10) {
    xdiff <- (10 - nchar(x)) * 3
    centre <- 80 + xdiff
  }

  if (nchar(x) > 10) {
    xdiff <- (nchar(x) - 10) * 3
    centre <- 80 - xdiff
  }


  if (nchar(x) == 10) {
    centre <- 80
  }


  format_centre <- stringr::str_c('+', centre, '+43')

  return(format_centre)
}
