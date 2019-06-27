# bronglaisBarcodes

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/aberWARU/bronglaisBarcodes.svg?branch=master)](https://travis-ci.org/aberWARU/bronglaisBarcodes) ![License](https://img.shields.io/badge/license-GNU%20GPL%20v3.0-blue.svg "GNU GPL v3.0")


#### Install

```r
remotes::install_github('aberWARU/bronglaisBarcodes')
```

This packages utilises the zint command line tool, and (for now) is only available for use on Linux OS. 


#### Usage

```R
library(bronglaisBarcodes)

generate_barcodes(filePath = '~/barcodeTestDirectory',
           ID = 'YOUR_ID_CODE',
           DOB = '01/01/1990'
           GENDER = 'M',
           ADDRESS = 'A_BUILDING',
           TYPE = c('FORM', 'LOG', 'FBC')
           )
```


