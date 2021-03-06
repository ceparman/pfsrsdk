#' getExperimentContainerCellIds - Gets cell ids for a container in an experiment.
#'
#' \code{getExperimentContainerCellIds} Gets cell ids for a container in an experiment.
#' @param coreApi coreApi object with valid jsessionid
#' @param experimentContainerBarcode container barcode
#' @param experimentContainerType container entity type (default: EXPERIMENT_CONTAINER)
#' @param useVerbose  Use verbose communication for debugging (default: FALSE)
#' @export
#' @return RETURN returns $entity a array of cell IDs and  $response contains the entire http response
#' @examples
#' \dontrun{
#' api <- coreAPI("PATH TO JSON FILE")
#' login <- authBasic(api)
#' cellIDs <- getExperimentContainerCellIds(login$coreApi, "BTCR1", "BITTERNESS EXPERIMENT CONTAINER")$entity
#' logOut(login$coreApi)
#' }
#' @author Scott Russell scott.russell@thermofisher.com
#' @description \code{getExperimentContainerCellIds} - Gets cell ids for a container in an experiment.

getExperimentContainerCellIds <-
  function(coreApi,
             experimentContainerBarcode,
             experimentContainerType = "EXPERIMENT_CONTAINER",
             useVerbose = FALSE) {
    resource <- odataCleanName(experimentContainerType)

    case(
      grepl("[0-2]+\\.[0-9]+\\.[0-9]+", coreApi$semVer) ~ {
        expansion <- "REV_IMPL_CONTAINER_CELL"
      },
      grepl("[3-9]+\\.[0-9]+\\.[0-9]+", coreApi$semVer) ~ {
        expansion <- "CELLS"
      }
    )

    query <-
      paste0(
        "('",
        experimentContainerBarcode,
        "')/CONTAINER?$expand=",
        expansion
      )

    header <- c(Accept = "application/json")

    out <-
      apiGET(
        coreApi,
        resource = resource,
        query = query,
        headers = header,
        useVerbose = useVerbose
      )

    cells <- unlist(lapply(out$content[[1]][[expansion]], function(x) x$Id))

    list(entity = cells, response = out$response)
  }
