# test_ProvDocument.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for ProvDocument.R
#=======================
require(prov4R, quietly = TRUE)
require(testthat)
require(XML)

context("ProvDocument")

test_that("encoding",{
  testthat::skip_on_cran()

  #custom report namespace
  registerProvNamespace("mys", "https://mysystem")

  #encoding
  prov <- ProvDocument$new()

  #-> add entity
  ent1 = ProvEntity$new()
  ent1$setId("report", "mys")
  ent1$addLabel("Computation report")
  prov$addEntity(ent1)

  #--> add activity

  xml = prov$encode()

  #decoding
  prov2 <- ProvDocument$new(xml = xml)
  xml2 <- prov2$encode()

  expect_true(ProvAbstractObject$compare(prov, prov2))

})
