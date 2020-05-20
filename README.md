
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rRofex <img src='man/figures/r-rofex.png' align="right" height="139"/>

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/matbarofex/rRofex.svg?branch=master)](https://travis-ci.com/matbarofex/rRofex)
<!-- badges: end -->

This package lets you access Matba Rofex API for trading using R. This
will enable you to integrate Matba Rofex’ data easily into R workflows.

You can find the complete documentation under
<https://apihub.primary.com.ar/>

## Installation

At the moment `rRofex` is only available through GitHub using
`devtools`.

#### Installing with `devtools`

``` r
# 1. In R install the package `devtools`.
install.packages("devtools")

# 2. Once `devtools` is installed, install `rRofex`
library(devtools)
devtools::install_github("gruporofex/rRofex")
```

## References

We provide two libraries for ingesting data from Matba Rofex:

  - **rRofex**: methods for trading.
  - [acyRsa](https://github.com/matbarofex/acyrsa): methods to accessing
    Back Office data from ACyRSA

### Methods for trading

These are the currently available methods:

  - Authentication
  - Methods to obtain information about products
  - Real-time and historical market data
  - Orders Placement
  - Orders Management
  - Account Information

Available environments:

  - *Demo Environment*: go to
    [reMarkets](https://remarkets.primary.ventures/) to get free
    credentials.
  - *Production*: for credentials please contact: <mpi@primary.com.ar>
    for more information.
  - *Production - xOMS*: please contact your broker for credentials.

## Examples

``` r
library(rRofex)

# Once you have cretencials, you'll be able to get a token when you login
conn <- trading_login(username = XXX, password = XXX, base_url ='https://api.remarkets.primary.com.ar')

# You can get a complete Reference Data list with details
trading_instruments(connection = conn, request = "securities", sec_detailed = T)

# Real Time Prices using the REST APP
trading_md(connection = conn, symbol = "DODic20")

# Historical Trades
trading_mdh(connection = conn, symbol = "DOJul20", date = "2020-02-06")
```

## Acknowledgments

Development of this software was driven by
[Primary](https://www.primary.com.ar/) as part of an Open Source
initiative of [Matba Rofex](https://matbarofex.com.ar/).

#### Author/Maintainer

  - [Augusto Hassel](https://github.com/augustohassel)

#### Internal Contributors

  - [Juan Francisco Gomez](https://github.com/jfgomezok)
