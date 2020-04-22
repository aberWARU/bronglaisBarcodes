#' Check Zint
#'
#' Check that zint is installed
#'
#' @keywords internal

check_zint <- function()
{
  zint_which <- Sys.which('zint')

  if (zint_which[['zint']] == "") {
    message(crayon::bold(crayon::red(cli::symbol$warning, 'zint not found')), '\n')
    message(
      crayon::yellow(
        'See README (https://github.com/aberWARU/bronglaisBarcodes) for installation instructions'
      )
    )

    stop('zint not found', call. = FALSE)

  } else{
    return(invisible(NULL))
  }
}
