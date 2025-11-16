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

  #-> add input dataset #1 entity
  input1 = ProvEntity$new()
  input1$setId("dataset1", "mys")
  input1$addLabel("Input dataset 1")
  prov$addEntity(input1)

  #-> add input dataset #1 entity
  input2 = ProvEntity$new()
  input2$setId("dataset2", "mys")
  input2$addLabel("Input dataset 2")
  prov$addEntity(input2)

  #-> add report entity
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

  #--> wasGenerateBy
  prov$addGeneration(ent1, act1, Sys.time())
  #--> used
  prov$addUsage(input1, act1, Sys.time())
  prov$addUsage(input2, act1, Sys.time())

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
