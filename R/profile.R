.onLoad <- function (libname, pkgname) { # nocov start
  #hidden objects
  assign(".prov4R", new.env(), envir= asNamespace(pkgname))
  
  #set PROV namespace
  setProvNamespaces()
  
  #set PROV schemas
  setProvSchemas()
  
} # nocov end