#' Resize Image Width
#'
#' Generate the values needed for `magick::image_resize()` to scale barcodes width relative to the DOB barcode
#'
#' @param barcode_imaage a `magick-image` of barcode that has read in using `magick::image_read()`
#' @return a character string of formatted width and height (ie, '93%x100%)
#'
#' @keywords internal

image_width_resize <- function(barcode_image)
{
  image_attr_size <-
    magick::image_attributes(barcode_image) %>% tibble::as_tibble() %>%
    dplyr::filter(stringr::str_detect(property, '.width,height')) %>%
    dplyr::select(value) %>% dplyr::pull() %>% stringr::str_split(., ',')

  image_attr_width <- as.numeric(image_attr_size[[1]][[1]])

  resize_value <- round((268 / image_attr_width) * 100, digits = 0)


  format_value <- stringr::str_c(resize_value, '%', 'x100%')

  return(format_value)
}
