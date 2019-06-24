#' Create ID Barcode
#'
#' This functions invokes a system command to `Zint` and outputs a **Code 128** barcode.
#'
#' Barcodes are saved to the directory which has been created using `create_directory`.
#'
#' @param id A character string of participant ID
#' @export

create_id_barcode <- function(id)
{
  fileOut <- 'ID.png'
  ZintCommand <-
    paste0("zint --notext --scale 1.0 --height 15",
           " -o ",
           "'",
           fileOut,
           "'",
           " -d ",
           "'",
           id,
           "'")
  system(ZintCommand, intern = TRUE)
  file.copy(from = fileOut, to = getOption('savePath'))
  file.remove(fileOut)

  return(invisible(NULL))
}
