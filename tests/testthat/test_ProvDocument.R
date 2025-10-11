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

  #encoding
  prov <- ProvDocument$new()
  xml = prov$encode()

  #decoding
  prov2 <- ProvDocument$new(xml = xml)
  xml2 <- prov2$encode()

  expect_true(ProvAbstractObject$compare(prov, prov2))

})
