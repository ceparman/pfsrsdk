#' isExperimentPublished gets a boolean indicating if an experiment is published.
#'
#' \code{isExperimentPublished} gets a boolean indicating if an experiment is published.
#' @param coreApi coreApi object with valid jsessionid
#' @param experimentType experiment entity type
#' @param experimentBarcode barcode of the experiment.
#' @param useVerbose Use verbose communication for debugging
#' @export
#' @return RETURN returns a list $status contains the experiment published status, $response contains the entire http response
#' @examples
#' \dontrun{
#' api <- coreAPI("PATH TO JSON FILE")
#' login <- authBasic(api)
#' update <- isExperimentPublished(login$coreApi, experimentType, experimentBarcode, useVerbose = TRUE)
#' logOut(login$coreApi)
#' }
#' @author Natasha Mora natasha.mora@thermofisher.com
#' @description \code{isExperimentPublished} - gets a boolean indicating if an experiment is published.


isExperimentPublished <-
  function(coreApi,
             experimentType,
             experimentBarcode,
             useVerbose = FALSE) {
    # build request

    resource <-
      paste0(odataCleanName(experimentType), "('", experimentBarcode, "')", "/PUBLISHED")

    headers <- c("Accept" = "application/json")

    response <-
      apiGET(
        coreApi,
        resource = resource,
        query = NULL,
        headers = headers,
        useVerbose = useVerbose
      )

    list(
      status = response$content, response = response$response
    )
  }
