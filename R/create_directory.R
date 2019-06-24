#' Create Temporary Directory
#'
#' @param filePath
#' @export

create_directory <- function(filePath)
{
  job_id <- uuid::UUIDgenerate(TRUE)

  dir.create(paste0(filePath, '/', job_id))

  options(savePath = paste0(filePath, '/', job_id))

  return(invisible(NULL))
}
