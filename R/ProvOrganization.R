#' ProvOrganization
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvOrganization
#' @title PROV organization class
#' @description This class models an PROV organization
#' @keywords prov entity organization
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV organization
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   organization <- ProvOrganization$new()
#'   organization$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvOrganization <- R6Class("ProvOrganization",
  inherit = ProvAgent,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "organization",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvOrganization}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
