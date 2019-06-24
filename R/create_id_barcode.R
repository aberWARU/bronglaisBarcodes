#' Create ID Barcode
#'
#' @param id
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
