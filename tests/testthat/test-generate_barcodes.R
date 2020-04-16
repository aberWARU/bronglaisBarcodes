test_that("generate_barcodes", {

 expect_error(
    generate_barcodes(
      getwd(),
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'NA',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ))

  expect_error(
    generate_barcodes(
      getwd(),
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'Male',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ))


  expect_error(
    generate_barcodes(
      getwd(),
      ID = 0123,
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ))


  expect_error(
    generate_barcodes(
      getwd(),
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'Male',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ))

  expect_error(
    generate_barcodes(
      getwd(),
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = 'Fbc',
      pathRename = FALSE
    ))

  expect_error(
    generate_barcodes(
      getwd(),
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = c('FORM', 'LOG', 'VITD', 'CHEM21', 'LOG', 'HBA1C', 'FORM', 'GLUCOSE'),
      pathRename = FALSE
    ))

})
