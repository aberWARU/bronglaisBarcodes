# bronglaisBarcodes

![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg) ![R-CMD-check](https://github.com/aberWARU/bronglaisBarcodes/workflows/R-CMD-check/badge.svg?branch=master) ![License](https://img.shields.io/badge/license-GNU%20GPL%20v3.0-blue.svg "GNU GPL v3.0")


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


