
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rRofex <img src='man/figures/logo.png' align="right" height="139"/>

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![Travis build
status](https://travis-ci.com/matbarofex/rRofex.svg?branch=master)](https://travis-ci.com/matbarofex/rRofex)
[![CRAN
status](https://www.r-pkg.org/badges/version/rRofex)](https://CRAN.R-project.org/package=rRofex)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/rRofex?color=orange)](https://cran.r-project.org/package=rRofex)
<!-- badges: end -->

With this package, you will be able to execute API calls to the ‘Matba
Rofex’ trading platform.

The main functionalites include:accessing account data and current
holdings, retrieving investment quotes, placing and canceling orders,
and getting reference data for instruments.

You can find the complete documentation under
<https://apihub.primary.com.ar/>

## Installation

``` r
# To install the package you just need to use the command:
install.packages("rRofex")

# Then load it with
library(rRofex)
```

#### Development version

You can use the development version to try new features or bug fixes
directly from GitHub.

``` r
# 1. In R install the package `devtools`.
install.packages("devtools")

# 2. Once `devtools` is installed, install `rRofex`
library(devtools)
devtools::install_github("matbarofex/rRofex")

# 3. Then load it with
library(rRofex)
```

## References

At the present we provide two libraries for ingesting data from Matba
Rofex:

-   **rRofex**: methods for trading.
-   [acyRsa](https://github.com/matbarofex/acyrsa): methods for
    accessing Back Office data from ACyRSA

### Summary of actions for trading

These are the currently available actions within the library:

-   Authentication
-   Reference data request
-   Real-time and historical market data request
-   Orders placement
-   Orders management
-   Account information request
-   Websocket methods

### Environments:

-   *Demo Environment*: go to
    [reMarkets](https://remarkets.primary.ventures/) to get free
    credentials.
-   *Production*: for credentials please contact: <mpi@primary.com.ar>
    for more information.
-   *Production - xOMS*: please contact your broker for credentials.

### Connection Protocols

There are currently three standard protocols that are being used to
connecting to the market::

1.  **REST**. Inside this library most methods use this protocol
    internaly.
2.  **Websocket**. The methods have the suffix ‘ws’ inside it’s name.
3.  *FIX*. We don’t have any short term plans to develop this wrapper.

## Examples

### 1. Authentication

There are different environment on which one can connect to.

For **paper trading** exists
[reMarkets](https://remarkets.primary.ventures/). If you go there, you
will be able to get free credentials to start trading with a demo
account.

If you already have a **live trading** account with a broker, you should
ask them what kind of *order management system* (OMS) do they use. If
they have the suite of **Primary**, then you will have to ask them for
the *user*, *password* and *base\_url*.

``` r
# Using `trading_login()` you will be able to connect. 
# You will need to use this object in each request made. You can have multiple connections simultaneously.
conn <- trading_login(
  username = XXX, 
  password = XXX, 
  base_url ='https://api.remarkets.primary.com.ar'
  )

# The connection is valid only for the day, you can get your log in information with `login_date_time()`
login_date_time(conn)
```

### 2. Reference Data

There are many types of request that you can make in order to get
reference data. The basic one is to ask for a detailed list of every
listed instrument.

``` r
# You can get a complete Reference Data list with details
trading_instruments(
  connection = conn, 
  request = "securities", 
  sec_detailed = T
  )

# If you are interested only in the front month of each contract of features, you can try
trading_instruments_fronts(connection = conn)

# If you only want equities
trading_instruments(
  connection = conn, 
  request = "by_type", 
  sec_type = "E"
  )
```

### 3. Market Data

You can access real time market data and historical market data. There
is a version with Websocket being developed.

``` r
# Real Time Prices using the REST protocol
trading_md(
  connection = conn, 
  symbol = "DODic20"
  )

# Historical Trades
trading_mdh(
  connection = conn, 
  symbol = "DOJul20", 
  date_from = "2020-02-06", 
  date_to = "2020-03-06"
  )
```

### 4. Order Placement

With the method `trading_new_order()` you will be able to trade on the
market. The basic order type is as follows:

``` r
trading_new_order(
  connection = conn, 
  account = "XXX", 
  symbol = "DOEne21", 
  side = "Buy", 
  quantity = 10, 
  price = 92.14
  )
```

### 5. Order Management

If you want to know the status of your arder, you will need ths method:

``` r
trading_orders(
  connection = conn, 
  account = "XXX"
  )
```

### 6. Account Information

With `trading_account()` and `trading_account_report()` you will be able
to obtain information about your current position in terms of
instruments and in terms of cash and settlement dates.

``` r
# With trading account you can get the information about your basket
trading_account(
  connection = conn, 
  account = "XXX"
  )

# With trading account report you can have your cash, margins, etc.
trading_account_report(
  connection = conn, 
  account = "XXX"
  )
```

### 7. Websocket Methods

Instead of requesting information using REST protocol, you could get it
through Websocket. This means, that you can listen to an object and be
notified every time that a change has been made.

The methods available in Websocket protool are:

-   Listen to Market Data with `trading_ws_md()`
-   Listen to Order status with `trading_ws_orders()`
-   Close Websocket connections with `trading_ws_close()`

## Acknowledgments

Development of this software was driven by
[Primary](https://www.primary.com.ar/) as part of an Open Source
initiative of [Matba Rofex](https://matbarofex.com.ar/).

#### Author/Maintainer

-   [Augusto Hassel](https://github.com/augustohassel)

#### Internal Contributors

-   [Juan Francisco Gomez](https://github.com/jfgomezok)
