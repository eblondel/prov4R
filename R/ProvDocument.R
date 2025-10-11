#' ProvDocument
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvDocument
#' @title PROV document class
#' @description This class models an PROV document
#' @keywords atom feed
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV document
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   prov <- ProvDocument$new()
#'   prov$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvDocument <- R6Class("ProvDocument",
  inherit = ProvAbstractObject,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "document",
    xmlNamespacePrefix = "PROV",
    document =TRUE
  ),
  public = list(

    #'@field entity  entity
    entity = list(),

    #'@description Initializes a \link{ProvDocument}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    },

    #'@description Adds entity
    #'@param entity entity
    addEntity = function(entity){
      self$addListElement("entity", entity)
    }
  )
)
