#' ProvBundle
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvBundle
#' @title PROV bundle class
#' @description This class models an PROV bundle
#' @keywords prov entity bundle
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV bundle
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   bundle <- ProvBundle$new()
#'   bundle$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvBundle <- R6Class("ProvBundle",
  inherit = ProvEntity,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "bundle",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvBundle}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
