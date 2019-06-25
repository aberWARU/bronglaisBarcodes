#' Generate Barcodes
#'
#' This is the main worker function of the whole package. `generate_barcodes` wraps up the barcode creation and arrangement and
#' saves them in the specified directory.
#'
#' @param filePath A valid directory path where barcodes are saved
#' @param ID A character string of participant ID
#' @param DOB A character string of Date-of Birth in the following format; **DD/MM/YYYY**
#' @param GENDER A character of either M or F (for Male and Female respectively)
#' @param ADDRESS A character string with no white space which is used as the sample address
#' @param TYPE A character vector of any of the following options
#'   * FORM
#'   * LOG
#'   * FBC
#'   * CHEM21
#'
#' @export

generate_barcodes <-
  function(filePath,
           ID,
           DOB,
           GENDER,
           ADDRESS,
           TYPE = c('FORM', 'LOG', 'FBC'))
  {
    create_directory(filePath = filePath)

    create_id_barcode(id = ID)
    create_dob_barcode(DOB = DOB)
    create_address_barcode(address = ADDRESS)


    for (i in seq_along(TYPE)) {
      barcode_out <-
        stack_barcodes(
          ID = ID,
          DOB = DOB,
          GENDER = GENDER,
          ADDRESS = ADDRESS,
          TYPE = TYPE[i]
        )

      image_write(barcode_out, path = paste0(getOption('savePath'), '/', TYPE[i], '.png'))

    }
    return(invisible(NULL))
  }
