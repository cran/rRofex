% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions_websocket.R
\name{trading_ws_md}
\alias{trading_ws_md}
\title{Web Sockets: Market Data Real Time}
\usage{
trading_ws_md(
  connection,
  destination,
  symbol,
  entries = list("BI", "OF", "LA", "OP", "CL", "SE", "OI", "HI", "LO", "TV", "IV",
    "EV", "NV", "TC"),
  listen_to = NA,
  market_id = "ROFX",
  where_is_env = .GlobalEnv
)
}
\arguments{
\item{connection}{S4. \strong{Mandatory} Formal rRofexConnection class object}

\item{destination}{String. Name of the tibble where the data is going to be stored.}

\item{symbol}{String. \strong{Mandatory}. Use \code{\link{trading_instruments}} to see which symbols are available.}

\item{entries}{List of Strings. It contains the information to be queried:
\itemize{
\item \strong{BI} - Bid.
\item \strong{OF} - Offer.
\item \strong{LA} - Last Available Price.
\item \strong{OP} - Open Price.
\item \strong{CL} - Close Price.
\item \strong{SE} - Settlement Price.
\item \strong{OI} - Open Interest.
\item \strong{HI} - Trading Session High Price
\item \strong{LO} - Trading Session Low Price
\item \strong{TV} - Trading Volume
\item \strong{IV} - Index Value
\item \strong{EV} - Trading Effective Volume
\item \strong{NV} - Nominal Volume
\item \strong{TC} - Trade Count
}}

\item{listen_to}{List. Column names from the tibble that you are going to listen to. This is not the same as entries names.}

\item{market_id}{String. Market to which you are going to connect.}

\item{where_is_env}{Environment. \strong{Only for advance users}.}
}
\value{
If correct, it will load a tibble.
}
\description{
\Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}
This method brings Market Data in Real Time using web socket protocol.
}
\examples{

# To create simultaneously many connections

\dontrun{
purrr::walk2(
.x = symbols,
.y = tickers,
.f = ~ trading_ws_md(connection = conn, destination = .y, symbol = .x)
)
}
}
\seealso{
Other websocket functions: 
\code{\link{trading_ws_close}()},
\code{\link{trading_ws_orders}()}
}
\concept{websocket functions}
