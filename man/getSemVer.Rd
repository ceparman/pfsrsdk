% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSemVer.R
\name{getSemVer}
\alias{getSemVer}
\title{getSemVer - Retrieves the PFS SemVer and creates a warning with the right value if null.}
\usage{
getSemVer(coreApi)
}
\arguments{
\item{coreApi}{coreApi object with valid jsessionid}
}
\value{
RETURN returns semVer containing the semVer of the PFS system.
}
\description{
\code{getSemVer} Retrieves the PFS SemVer and creates a warning with the right value if null.
}
\details{
\code{getSemVer} Retrieves the PFS SemVer and creates a warning with the right value if null.
}
\examples{
\dontrun{
api <- coreAPI("PATH TO JSON FILE")
login <- authBasic(api)
semver <- getSemVer(login$coreApi)
logOut(login$coreApi)
}
}
\author{
Adam Wheeler adam.wheeler@thermofisher.com

Natasha Mora natasha.mora@thermofisher.com
}
