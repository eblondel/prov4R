#' ProvSoftwareAgent
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvSoftwareAgent
#' @title PROV softwareAgent class
#' @description This class models an PROV softwareAgent
#' @keywords prov entity softwareAgent
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV softwareAgent
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   softwareAgent <- ProvSoftwareAgent$new()
#'   softwareAgent$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvSoftwareAgent <- R6Class("ProvSoftwareAgent",
  inherit = ProvAgent,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "softwareAgent",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvSoftwareAgent}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
