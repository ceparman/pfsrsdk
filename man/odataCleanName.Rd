% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/odataCleanName.R
\name{odataCleanName}
\alias{odataCleanName}
\title{odataCleanName - converts names to ODATA compliant version. Used to clean names in ODATA calls.}
\usage{
odataCleanName(name, refType = "odataObject")
}
\arguments{
\item{name}{string to clean}

\item{refType}{Reference to the type of object being passed.}
}
\value{
Returns name in ODATA compliant form
}
\description{
\code{odataCleanName} - converts names to ODATA compliant version. Used to clean names in ODATA calls.
}
\details{
\code{odataCleanName} Clean a name for ODATA.
}
\section{Handling \code{refType} parameter}{

As of now the \code{refType} parameter defaults to the Value of "odataObject"
This will ensure that the leading underscode is placed in front of numbers
at the beginning of the odata string to comply with Odata Standards. However,
This function can be used for other objects as well to replace spaces and
hyphens with underscores.
}

\examples{
\dontrun{
new_name <- odataCleanName("384 Well Plate")
# returns "_384_WELL_PLATE"
new_name <- odataCleanName("384 Well Plate", "tenant")
# returns "384_WELL_PLATE"
}
}
\author{
Craig Parman info@ngsanalytics.com

Adam Wheeler adam.wheeler@thermofisher.com

Scott Russell scott.russell@thermofisher.com
}
