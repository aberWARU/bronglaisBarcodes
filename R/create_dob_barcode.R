#' Create Date-of-Birth (DOB) Barcode
#'
#' @param DOB
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
