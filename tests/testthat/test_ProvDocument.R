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
  ent1$addLabel("Statistical report")
  prov$addEntity(ent1)

  #--> add activity
  act1 = ProvActivity$new()
  act1$setId("generateReport", "mys")
  act1$addLabel("Generate report")
  act1$setStartTime(Sys.time())
  act1$setEndTime(Sys.time()+10000)
  prov$addActivity(act1)

  #--> add agents
  ag = ProvAgent$new();ag$setId("the.agent")
  prov$addAgent(ag)
  p = ProvPerson$new();p$setId("the.person")
  prov$addPerson(p)
  org = ProvOrganization$new();org$setId("the.org")
  prov$addOrganization(org)
  soft = ProvSoftwareAgent$new();soft$setId("the.software")
  prov$addSoftwareAgent(soft)

  xml = prov$encode()

  #decoding
  prov2 <- ProvDocument$new(xml = xml)
  xml2 <- prov2$encode()

  expect_true(ProvAbstractObject$compare(prov, prov2))

})
