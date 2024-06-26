% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reportCalibration.R
\name{.computeRelDev}
\alias{.computeRelDev}
\title{Compute the relative deviation to historical data as the relative euclidean distance}
\usage{
.computeRelDev(dfDev, dfHist, tCalib, notInHist = NULL)
}
\arguments{
\item{dfDev}{data frame, containing deviation between calibration and historical data}

\item{dfHist}{data frame or a list of one or two data frames, containing historical data.
The option to pass two data frames is used to combine construction and renovation flows.
If two data frames are passed, the first one is assumed to be construction, the second renovation}

\item{tCalib}{numerical/factor, calibration time periods to filter historical data}

\item{notInHist}{character vector, pass columns that historical data should not be grouped by
when computing the sum of the squares}
}
\value{
data frame with relative deviation in value column
}
\description{
Compute the relative deviation to historical data as the relative euclidean distance
}
