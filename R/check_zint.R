#' Check Zint
#'
#' Check that zint is installed
#'
#' @return a numeric value of 0 or 1. O if `zint` is not available and 1 if it is
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

    return(0)

  } else{
    return(1)
  }
}
