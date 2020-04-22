test_that("generate_barcodes", {

    expect_error(
    generate_barcodes(
      '~/',
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'NA',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ),
    'GENDER must be M or F'
  )

  expect_error(
    generate_barcodes(
      '~/',
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'Male',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ),
    'GENDER must be M or F'
  )


  expect_error(
    generate_barcodes(
      '~/',
      ID = 0123,
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = 'FORM',
      pathRename = FALSE
    ),
    'ID must be a character string'
  )


  expect_error(
    generate_barcodes(
      '~/',
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = 'Fbc',
      pathRename = FALSE
    ),
    'Incorrect TYPE, check input and try again'
  )

  expect_error(
    generate_barcodes(
      '~/',
      ID = 'TEST',
      DOB = '01/01/2000',
      GENDER = 'M',
      ADDRESS = 'Uni',
      TYPE = c(
        'FORM',
        'LOG',
        'VITD',
        'CHEM21',
        'LOG',
        'HBA1C',
        'FORM',
        'GLUCOSE',
        'LOG'
      ),
      pathRename = FALSE
    ),
    'TYPE exceeds the number of available options'
  )

})
