#'
#'
#'
#'
#'
#'

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
