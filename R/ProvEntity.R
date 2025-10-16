#' ProvEntity
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvEntity
#' @title PROV entity class
#' @description This class models an PROV entity
#' @keywords prov entity
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV entity
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   entity <- ProvEntity$new()
#'   entity$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvEntity <- R6Class("ProvEntity",
  inherit = ProvAbstractObject,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "entity",
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

    #'@description Initializes a \link{ProvEntity}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    },

    #'@description Set ID
    #'@param id id
    #'@param ns namespace prefix
    setId = function(id, ns){
      if(!ns %in% sapply(getProvNamespaces(), function(x){x$id})){
        stop(sprintf("Namespace '%s' doesn't seem to be registered!", ns))
      }
      self$attrs["prov:id"] = paste0(ns,":",id)
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
