# test_ProvPerson.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for ProvPerson.R
#=======================
require(prov4R, quietly = TRUE)
require(testthat)
require(XML)

context("ProvPerson")

test_that("encoding",{
  testthat::skip_on_cran()

  #encoding
  prov <- ProvPerson$new()
  prov$setId("john.doe")
  prov$addLabel("label1")
  prov$addLabel("label2")
  prov$addLocation("loc1")
  prov$addLocation("loc2")
  prov$addType("type1")
  prov$addType("type2")
  xml = prov$encode()

  #decoding
  prov2 <- ProvPerson$new(xml = xml)
  xml2 <- prov2$encode()

  expect_true(ProvAbstractObject$compare(prov, prov2))

})
