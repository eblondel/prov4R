#' ProvPerson
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvPerson
#' @title PROV person class
#' @description This class models an PROV person
#' @keywords prov entity person
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV person
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   person <- ProvPerson$new()
#'   person$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvPerson <- R6Class("ProvPerson",
  inherit = ProvAgent,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "person",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvPerson}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
