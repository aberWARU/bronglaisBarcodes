#' Stack Barcodes
#'
#' This use `magick` to arrange the barcodes into a single image and add the necessary text annotations.
#'
#' @param ID A character string of participant ID
#' @param DOB A character string of Date-of Birth in the following format; **DD/MM/YYYY**
#' @param GENDER A character of either M or F (for Male and Female respectively)
#' @param ADDRESS A character string with no white space which is used as the sample address
#' @param TYPE A character vector of any of the following options; FORM, LOG, FBC, CHEM21
#'
#' @keywords internal
#' @importFrom magick image_read image_scale image_annotate image_resize image_append image_write
#' @importFrom magrittr %>%

stack_barcodes <-
  function(ID = ID,
           DOB = DOB,
           GENDER = GENDER,
           ADDRESS = ADDRESS,
           TYPE)
  {
    id_barcode <-
      image_read(paste0(getOption('savePath'), '/ID.png')) %>% image_resize(., '85%x100%')

    dob_barcode <-
      image_read(paste0(getOption('savePath'), '/DOB.png')) %>% image_resize(., '93%x100%')

    address_barcode <-
      image_read(paste0(getOption('savePath'), '/ADDRESS.png')) %>% image_resize(., '51%x100%')


    white_space <-
      image_read(system.file(package = 'bronglaisBarcodes', 'white_space.png'))

    white_space2 <-
      image_read(system.file(package = 'bronglaisBarcodes', 'white_space.png')) %>% image_scale(., 'x5')


    id_stack <-
      c(id_barcode, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(.,
                                                                                      ID,
                                                                                      font = 'Arial',
                                                                                      size = 14,
                                                                                      location = '+80+30') %>%
      image_annotate(.,
                     GENDER,
                     font = 'Arial',
                     size = 14,
                     location = '+210+30')


    dob_stack <-
      c(dob_barcode, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(.,
                                                                                       DOB,
                                                                                       font = 'Arial',
                                                                                       size = 14,
                                                                                       location = '+80+35')

    address_stack <-
      c(address_barcode, white_space, white_space2) %>% image_append(., stack = TRUE) %>% image_annotate(.,
                                                                                                         ADDRESS,
                                                                                                         font = 'Arial',
                                                                                                         size = 14,
                                                                                                         location = '+50+32')


    if (TYPE == 'FORM') {
      type_stack <-
        c(white_space, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(.,
                                                                                         'FORM',
                                                                                         font = 'Arial',
                                                                                         size = 12,
                                                                                         location = '+180+15')
    }

    if (TYPE == 'LOG') {
      type_stack <-
        c(white_space, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(.,
                                                                                         'LOG',
                                                                                         font = 'Arial',
                                                                                         size = 12,
                                                                                         location = '+180+15')
    }

    if (TYPE == 'FBC') {
      type_stack <-
        c(white_space, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(
          .,
          'Purple top: FBC',
          font = 'Arial',
          size = 12,
          location = '+180+15'
        )
    }

    if (TYPE == 'CHEM21') {
      type_stack <-
        c(white_space, white_space) %>% image_append(., stack = TRUE) %>% image_annotate(
          .,
          'Yellow top: U&E,LFT,CRP,LIP,FER,AST,GGT',
          font = 'Arial',
          size = 12,
          location = '+40+15'
        )
    }




    final_barcode <-
      c(white_space2, id_stack, address_stack, dob_stack, type_stack) %>% image_append(., stack = TRUE)


    return(final_barcode)
  }
