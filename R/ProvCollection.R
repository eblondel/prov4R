#' ProvCollection
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvCollection
#' @title PROV plan class
#' @description This class models an PROV collection
#' @keywords prov entity collection
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV collection
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   collection <- ProvCollection$new()
#'   collection$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvCollection <- R6Class("ProvCollection",
  inherit = ProvEntity,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "collection",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvCollection}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
