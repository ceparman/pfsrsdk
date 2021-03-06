#' attributeCleanName - converts names to uppercase and replaces spaces
#' ampersands and percent symbols with underscores to reference attribute
#' names.
#' \code{attributeCleanName} clean attribute name.
#' @param name  string to clean
#' @export
#' @return Returns attribute name as the API will use.
#' @examples
#' \dontrun{
#' new_name <- attributeCleanName("My Comments")
#' new_name
#' MY_COMMENTS
#' }
#' @author Craig Parman info@ngsanalytics.com
#' @author Adam Wheeler adam.wheeler@thermofisher.com
#' @description \code{attriureCleanName} - onverts names to uppercase and replaces spaces with underscores to
#' reference attribute names.

attributeCleanName <- function(name) {
  name <- toupper(name)
  name <- gsub("[ ,&,%]", "_", name)
  name
}
