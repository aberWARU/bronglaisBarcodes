#' Create Date-of-Birth (DOB) Barcode
#'
#' This functions invokes a system command to `Zint` and outputs a **Code 128** barcode.
#'
#' Barcodes are saved to the directory which has been created using `create_directory`.
#'
#' @param DOB A character string of Date-of Birth in the following format; **DD/MM/YYYY**
#' @export


create_dob_barcode <- function(DOB)
{
  fileOut <- 'DOB.png'
  ZintCommand <-
    paste0("zint --notext --scale 1.0 --height 15",
           " -o ",
           "'",
           fileOut,
           "'",
           " -d ",
           "'",
           DOB,
           "'")
  system(ZintCommand, intern = TRUE)
  file.copy(from = fileOut, to = getOption('savePath'))
  file.remove(fileOut)

  return(invisible(NULL))

}
