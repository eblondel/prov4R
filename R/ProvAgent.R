#' ProvAgent
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvAgent
#' @title PROV agent class
#' @description This class models an PROV agent
#' @keywords prov agent
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV agent
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   agent <- ProvAgent$new()
#'   agent$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvAgent <- R6Class("ProvAgent",
  inherit = ProvAbstractObject,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "agent",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@field label label
    label = list(),
    #'@field location location
    location = list(),
    #'@field type type
    type = list(),

    #'@description Initializes a \link{ProvAgent}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    },

    #'@description Adds label
    #'@param label label
    #'@return \code{TRUE} if added, \code{FALSE} otherwise
    addLabel = function(label){
      self$addListElement("label", label)
    },

    #'@description Adds location
    #'@param location location
    #'@return \code{TRUE} if added, \code{FALSE} otherwise
    addLocation = function(location){
      self$addListElement("location", location)
    },

    #'@description Adds type
    #'@param type type
    #'@return \code{TRUE} if added, \code{FALSE} otherwise
    addType = function(type){
      self$addListElement("type", type)
    }

  )
)
