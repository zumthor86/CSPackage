context("Summary")

setwd(system.file("testdata",package = "CSPackage"))

farsSummary <- fars_read_years(2013:2015)

test_that("Summary is list of Tibbles", {

  expect_is(farsSummary,"list")
  expect_is(farsSummary[[1]], "data.frame")


})





