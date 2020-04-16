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
#'  * **FORM** : Transfer Form
#'  * **LOG** : Log Book
#'  * **FBC** : Full Blood Count
#'  * **CHEM21** : Chemistry-21 Panel (LFT, U&E)
#'  * **VITD** : Vitamin-D
#'  * **GLUCOSE** : Glucose
#'  * **HBA1C** : Glycated Haemoglobin (HbA1c)
#'  * **INSULIN** : Insulin
#' @param pathRename logical; if `TRUE` then the directory where barcodes are saved to will be named `ID` + `Sys.Date()`. IF `FALSE` (default)
#' then the original UID code will be used for directory namming.
#'
#' @export

generate_barcodes <-
  function(filePath,
           ID,
           DOB,
           GENDER,
           ADDRESS,
           TYPE = c('FORM', 'LOG', 'FBC'),
           pathRename = FALSE)
  {
    zint_status <- check_zint()
    if (zint_status == 0) {
      return(invisible(NULL))
    }


    if (GENDER != 'M' |
        GENDER != 'F') {
      stop('GENDER must be M or F', call. = FALSE)
    }

    if (!is.character(ID)) {
      stop('ID must be a character string', call. = FALSE)
    }

    if (length(TYPE) > 8) {
      stop('TYPE exceeds the number of available options', call. = FALSE)
    }


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

      magick::image_write(barcode_out, path = paste0(getOption('savePath'), '/', TYPE[i], '.png'))

    }

    file.remove(stringr::str_c(getOption('savePath'), '/ID.png'))
    file.remove(stringr::str_c(getOption('savePath'), '/DOB.png'))
    file.remove(stringr::str_c(getOption('savePath'), '/ADDRESS.png'))

    if (isTRUE(pathRename)) {
      file.rename(
        from = getOption('savePath'),
        to = stringr::str_c(filePath, '/', ID, '_', Sys.Date())
      )
      options(savePath =  stringr::str_c(filePath, '/', ID, '_', Sys.Date()))
    }

    message(crayon::green(cli::symbol$tick, 'Barcodes saved to', getOption('savePath')))

    return(invisible(NULL))
  }
