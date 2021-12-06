#' Stack Barcodes
#'
#' This use `magick` to arrange the barcodes into a single image and add the necessary text annotations.
#'
#' @param ID A character string of participant ID
#' @param DOB A character string of Date-of Birth in the following format; **DD/MM/YYYY**
#' @param GENDER A character of either M or F (for Male and Female respectively)
#' @param ADDRESS A character string with no white space which is used as the sample address
#' @param TYPE A character vector of any of the following options; FORM, LOG, FBC, CHEM21, VITD, GLUCOSE, HBA1C, INSULIN
#'
#' @keywords internal
#' @importFrom magrittr %>%

stack_barcodes <-
  function(ID = ID,
           DOB = DOB,
           GENDER = GENDER,
           ADDRESS = ADDRESS,
           TYPE)
  {
    id_barcode <-
      magick::image_read(paste0(getOption('savePath'), '/ID.png'))

    id_width <- image_width_resize(id_barcode)

    id_barcode <- id_barcode %>% magick::image_resize(., id_width)

    dob_barcode <-
      magick::image_read(paste0(getOption('savePath'), '/DOB.png'))

    address_barcode <-
      magick::image_read(paste0(getOption('savePath'), '/ADDRESS.png'))

    address_width <- image_width_resize(address_barcode)

    address_barcode <-
      address_barcode %>% magick::image_resize(., address_width)



    white_space <-
      magick::image_read(system.file(package = 'bronglaisBarcodes', 'white_space.png'))

    white_space2 <-
      magick::image_read(system.file(package = 'bronglaisBarcodes', 'white_space.png')) %>% magick::image_scale(., 'x5')


    id_stack <-
      c(id_barcode, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(.,
                                                                                                      ID,
                                                                                                      font = 'Arial',
                                                                                                      size = 14,
                                                                                                      location = text_location(ID)) %>%
      magick::image_annotate(.,
                             GENDER,
                             font = 'Arial',
                             size = 14,
                             location = '+210+43')


    dob_stack <-
      c(dob_barcode, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(.,
                                                                                                       DOB,
                                                                                                       font = 'Arial',
                                                                                                       size = 14,
                                                                                                       location = text_location(DOB))

    address_stack <-
      c(address_barcode, white_space, white_space2) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
        .,
        ADDRESS,
        font = 'Arial',
        size = 14,
        location = text_location(ADDRESS)
      )


    if (TYPE == 'FORM') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(.,
                                                                                                         'FORM',
                                                                                                         font = 'Arial',
                                                                                                         size = 12,
                                                                                                         location = '+180+15')
    }

    if (TYPE == 'LOG') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(.,
                                                                                                         'LOG',
                                                                                                         font = 'Arial',
                                                                                                         size = 12,
                                                                                                         location = '+180+15')
    }

    if (TYPE == 'FBC') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Purple top: FBC',
          font = 'Arial',
          size = 12,
          location = '+180+15'
        )
    }

    if (TYPE == 'CHEM21') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Yellow top: U&E,LFT,CRP,LIP,FER,AST,GGT',
          font = 'Arial',
          size = 12,
          location = '+40+15'
        )
    }

    if (TYPE == 'VITD') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Purple top: Vitamin D',
          font = 'Arial',
          size = 12,
          location = '+160+15'
        )
    }

    if (TYPE == 'GLUCOSE') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Grey top: Glucose',
          font = 'Arial',
          size = 12,
          location = '+165+15'
        )
    }


    if (TYPE == 'HBA1C') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Purple top: HbA1c',
          font = 'Arial',
          size = 12,
          location = '+170+15'
        )
    }

    if (TYPE == 'INSULIN') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Yellow top: Insulin',
          font = 'Arial',
          size = 12,
          location = '+170+15'
        )
    }

    if (TYPE == 'CRP') {
      type_stack <-
        c(white_space, white_space) %>% magick::image_append(., stack = TRUE) %>% magick::image_annotate(
          .,
          'Yellow top: CRP',
          font = 'Arial',
          size = 12,
          location = '+170+15'
        )
    }




    final_barcode <-
      c(white_space2, id_stack, address_stack, dob_stack, type_stack) %>% magick::image_append(., stack = TRUE)


    return(final_barcode)
  }
