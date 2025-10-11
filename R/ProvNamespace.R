#' ProvNamespace
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @keywords ISO metadata namespace
#' @return Object of \code{ \link[R6]{R6Class}} for modelling an Atom Namespace
#' @format \code{ \link[R6]{R6Class}} object.
#'
#' @note ISO class used internally by prov4R for specifying XML namespaces
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
ProvNamespace <- R6Class("ProvNamespace",
   public = list(
     #'@field id id
     id = NA,
     #'@field uri uri
     uri = NA,

     #'@description Initializes an \link{ProvNamespace}
     #'@param id id
     #'@param uri uri
     initialize = function(id, uri){
       self$id = id
       self$uri = uri
     },

     #'@description Get definition
     #'@return a named list defining the namespace
     getDefinition = function(){
       ns <- list(self$uri)
       names(ns) <- self$id
       return(ns)
     }
   )
)
ProvNamespace$PROV = ProvNamespace$new("prov", "http://www.w3.org/ns/prov#")
ProvNamespace$XLINK = ProvNamespace$new("xlink", "http://www.w3.org/1999/xlink")
ProvNamespace$XSI = ProvNamespace$new("xsi", "http://www.w3.org/2001/XMLSchema-instance")

#' setMetadataNamespaces
#' @export
setProvNamespaces <- function(){
  .prov4R$namespaces <- list(
    ProvNamespace$PROV,
    ProvNamespace$XLINK,
    ProvNamespace$XSI
  )
}

#' @name getProvNamespaces
#' @aliases getProvNamespaces
#' @title getProvNamespaces
#' @export
#' @description \code{getProvNamespaces} gets the list of namespaces registered
#'
#' @usage getProvNamespaces()
#'
#' @examples
#'   getProvNamespaces()
#'
#' @author Emmanuel Blondel, \email{emmanuel.blondel1@@gmail.com}
#
getProvNamespaces = function(){
  return(.prov4R$namespaces)
}

#' @name getProvNamespace
#' @aliases getProvNamespace
#' @title getProvNamespace
#' @export
#' @description \code{getProvNamespace} gets a namespace given its id
#'
#' @usage getProvNamespace(id)
#'
#' @param id namespace prefix
#'
#' @examples
#'   getProvNamespace("GMD")
#'
#' @author Emmanuel Blondel, \email{emmanuel.blondel1@@gmail.com}
#
getProvNamespace = function(id){
  return(ProvNamespace[[id]])
}

#' @name registerProvNamespace
#' @aliases registerProvNamespace
#' @title registerProvNamespace
#' @export
#' @description \code{registerProvNamespace} allows to register a new namespace
#' in \pkg{prov4R}
#'
#' @usage registerProvNamespace(id, uri, force)
#'
#' @param id prefix of the namespace
#' @param uri URI of the namespace
#' @param force logical parameter indicating if registration has be to be forced
#' in case the identified namespace is already registered
#'
#' @examples
#'   registerProvNamespace(id = "myprefix", uri = "http://someuri")
#'
#' @author Emmanuel Blondel, \email{emmanuel.blondel1@@gmail.com}
#
registerProvNamespace <- function(id, uri, force = FALSE){
  ns <- getProvNamespace(toupper(id))
  if(!is.null(ns)){
    if(!force) stop(sprintf("PROV Namespace with id '%s' already exists. Use force = TRUE to force registration", id))
    ns <- ProvNamespace$new(id, uri)
    ProvNamespace[[toupper(id)]] <- ns
    .prov4R$namespaces[sapply(.prov4R$namespaces, function(x){x$id == id})][[1]] <- ns
  }else{
    ns <- ProvNamespace$new(id, uri)
    ProvNamespace[[toupper(id)]] <- ns
    .prov4R$namespaces <- c(.prov4R$namespaces, ns)
  }
}
