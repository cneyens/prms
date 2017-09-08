# prms
R functions for facillitating the reading and writing of input and output files for the USGS Precipitation Runoff Modeling System - Version 4 [(PRMS)](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html)

## To install

1. install the devtools package: `install.packages("devtools")`
2. install prms: `devtools::install_github("cneyens/prms")`

## For users
This package was constructed to use the R environment to perform sensitivity and optimization analyses on PRMS models. The functions are therefore constructed in such a way that building a cost function in R is relatively straightforward. Additionally, functions for reading in output (.csv & Map Results) for postprocessing are incorporated in the code as well. Most likely, I will *not* be updating or adding new features any time soon (if ever). This also means that support will be limited to fixing existing bugs in the code. So feel free to fork this repo for your own use and/or extending the functionalities.

## Bug reports
For any bug reports, please [open a new issue](https://github.com/cneyens/prms/issues).

## Versions
Version 0.1.0 - September 2017

## References
[Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the
precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7,
158 p., http://dx.doi.org/10.3133/tm6B7](https://pubs.usgs.gov/tm/6b7/)