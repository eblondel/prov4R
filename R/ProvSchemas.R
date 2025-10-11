#' @name registerProvSchema
#' @aliases registerProvSchema
#' @title registerProvSchema
#' @export
#' @description \code{registerProvSchema} allows to register a new schema
#' in \pkg{prov4R}
#'
#' @usage registerProvSchema(xsdFile)
#'
#' @param xsdFile the schema XSD file
#'
#' @examples
#'   prov_xsd_file <- system.file("extdata/schemas/prov.xsd", package = "prov4R")
#'   registerProvSchema(xsdFile = prov_xsd_file)
#'
#' @author Emmanuel Blondel, \email{emmanuel.blondel1@@gmail.com}
#
registerProvSchema <- function(xsdFile){
  schemas <- tryCatch({
    isSourceUrl <- regexpr("(http|https)[^([:blank:]|\\\"|<|&|#\n\r)]+", xsdFile) > 0
    if(isSourceUrl) xsdFile <- httr::content(httr::GET(xsdFile),"text")
    XML::xmlParse(
      xsdFile, isSchema = TRUE, xinclude = TRUE,
      error = function (msg, code, domain, line, col, level, filename, class = "XMLError"){}
    )
  })
  .prov4R$schemas <- schemas
}

#'setProvSchemas
#'@export
setProvSchemas <- function(){
  schemaPath <- "extdata/schemas"
  namespace <- "prov"
  defaultXsdFile <- system.file(schemaPath, paste0(namespace,".xsd"),
                                package = "prov4R", mustWork = TRUE)
  registerProvSchema(defaultXsdFile)
}

#' @name getProvSchemas
#' @aliases getProvSchemas
#' @title getProvSchemas
#' @export
#' @description \code{getProvSchemas} gets the schemas registered in \pkg{prov4R}
#'
#' @usage getProvSchemas()
#'
#' @examples
#'   getProvSchemas()
#'
#' @author Emmanuel Blondel, \email{emmanuel.blondel1@@gmail.com}
#
getProvSchemas <- function(){
  return(.prov4R$schemas)
}
