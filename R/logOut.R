#' logOut -Log user out of the LIMS.
#'
#' \code{logOut} logs user out of the Core API
#'
#' @param coreApi coreApi object returned during log in
#' @param useVerbose use verbose option for debuggin in http POST
#' @return returns list with $success = "Success" when sucessful, $response contains the entire http response
#' @export
#' @examples
#' \dontrun{
#' api <- coreAPI("PATH TO JSON FILE")
#' response <- authBasic(api)
#' logOut <- logOut(response$coreApi, useVerbose = TRUE)
#' }
#' @author Craig Parman info@ngsanalytics.com
#' @description \code{logOut} logs out of the current session.



### Log out

logOut <- function(coreApi, useVerbose = FALSE) {
  request <-
    list(
      request = list(
        sdkCmd = jsonlite::unbox("sdk-logout"),
        typeParam = jsonlite::unbox("*"),
        data = NULL
      ),
      responseOptions = list()
    )

  headers <-
    c("Content-Type" = "application/json", accept = "application/json")

  response <-
    apiPOST(
      coreApi = coreApi,
      body = request,
      headers = headers,
      encode = "json",
      special = "login",
      useVerbose = useVerbose
    )


  list(
    success = httr::http_status(response)$category,
    response = response
  )
}
