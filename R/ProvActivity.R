#' ProvActivity
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvActivity
#' @title PROV activity class
#' @description This class models an PROV activity
#' @keywords atom feed
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV activity
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   activity <- ProvActivity$new()
#'   activity$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvActivity <- R6Class("ProvActivity",
  inherit = ProvAbstractObject,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "activity",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@field startTime startTime
    startTime = NULL,
    #'@field endTime endTime
    endTime = NULL,
    #'@field label label
    label = list(),
    #'@field location location
    location = list(),
    #'@field type type
    type = list(),

    #'@description Initializes a \link{ProvActivity}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    },

    #'@description Set ID
    #'@param id id
    #'@param ns namespace prefix
    setId = function(id, ns){
      self$setProvAttr("id", id, ns)
    },

    #'@description Set start time
    #'@param startTime start time
    setStartTime = function(startTime){
      self$startTime = startTime
    },

    #'@description Set end time
    #'@param endTime end time
    setEndTime = function(endTime){
      self$endTime = endTime
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
