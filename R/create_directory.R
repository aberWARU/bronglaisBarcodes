#' Create Temporary Directory
#'
#' @param filePath A valid directory path where barcodes are saved
#' @export

create_directory <- function(filePath)
{
  job_id <- uuid::UUIDgenerate(TRUE)

  dir.create(paste0(filePath, '/', job_id))

  options(savePath = paste0(filePath, '/', job_id))

  return(invisible(NULL))
}
