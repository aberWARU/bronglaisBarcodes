#' Create Address Barcode
#'
#' This functions invokes a system command to `Zint` and outputs a **Code 128** barcode.
#'
#' Barcodes are saved to the directory which has been created using `create_directory`.
#'
#' @param address A character string with no white space which is used as the sample address
#' @export

create_address_barcode <- function(address = 'CarwynJamesBuilding')
{
  fileOut <- 'ADDRESS.png'
  ZintCommand <-
    paste0("zint --notext --scale 1.0 --height 15",
           " -o ",
           "'",
           fileOut,
           "'",
           " -d ",
           "'",
           address,
           "'")
  system(ZintCommand, intern = TRUE)
  file.copy(from = fileOut, to = getOption('savePath'))
  file.remove(fileOut)

  return(invisible(NULL))

}
