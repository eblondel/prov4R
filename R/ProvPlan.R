#' ProvPlan
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvPlan
#' @title PROV plan class
#' @description This class models an PROV plan
#' @keywords prov entity plan
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV plan
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   plan <- ProvPlan$new()
#'   plan$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvPlan <- R6Class("ProvPlan",
  inherit = ProvEntity,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "plan",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@description Initializes a \link{ProvPlan}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    }
  )
)
