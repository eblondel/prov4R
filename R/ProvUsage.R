#' ProvUsage
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#'
#' @name ProvUsage
#' @title PROV usage class
#' @description This class models an PROV usage
#' @keywords atom feed
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an PROV usage
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @examples
#'   #encoding
#'   gen <- ProvUsage$new()
#'   gen$encode()
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvUsage <- R6Class("ProvUsage",
  inherit = ProvAbstractObject,
  lock_class = FALSE,
  lock_objects = FALSE,
  private = list(
    xmlElement = "used",
    xmlNamespacePrefix = "PROV",
    document = FALSE
  ),
  public = list(

    #'@field activity activity
    activity = NULL,
    #'@field entity entity
    entity = NULL,
    #'@field time time
    time = NULL,

    #'@field label label
    label = list(),
    #'@field location location
    location = list(),
    #'@field type type
    type = list(),

    #'@description Initializes a \link{ProvUsage}
    #'@param xml object of class \link[XML]{XMLInternalNode-class} from \pkg{XML}
    initialize = function(xml = NULL){
      super$initialize(xml = xml)
    },

    #'@description Set entity
    #'@param entity entity
    setEntity = function(entity){
      if(!is(entity, "ProvEntity")){
        stop("Argument 'entity' should be an object of class 'ProvEntity'")
      }
      if(!is.null(entity$getId())){
        ent = ProvEntity$new()
        ent$setRef(entity$getId())
        self$entity = ent
      }else{
        self$entity = entity
      }
    },

    #'@description Set activity
    #'@param activity activity
    setActivity = function(activity){
      if(!is(activity, "ProvActivity")){
        stop("Argument 'activity' should be an object of class 'ProvActivity'")
      }
      if(!is.null(activity$getId())){
        act = ProvActivity$new()
        act$setRef(activity$getId())
        self$activity = act
      }else{
        self$activity = activity
      }
    },

    #'@description Set time
    #'@param time time
    setTime = function(time){
      self$time = time
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
