#' Create Address Barcode
#'
#' @param address
#' @export
#'
#'

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
