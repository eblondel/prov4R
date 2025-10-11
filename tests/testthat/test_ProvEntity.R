# test_ProvEntity.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for ProvEntity.R
#=======================
require(prov4R, quietly = TRUE)
require(testthat)
require(XML)

context("ProvEntity")

test_that("encoding",{
  testthat::skip_on_cran()

  #encoding
  prov <- ProvEntity$new()
  prov$addLabel("label1")
  prov$addLabel("label2")
  prov$addLocation("loc1")
  prov$addLocation("loc2")
  prov$addType("type1")
  prov$addType("type2")
  xml = prov$encode()

  #decoding
  prov2 <- ProvEntity$new(xml = xml)
  xml2 <- prov2$encode()

  expect_true(ProvAbstractObject$compare(prov, prov2))

})
