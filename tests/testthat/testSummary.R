context("Summary")

setwd(paste0(getwd(),"/inst/testData"))

farsSummary <- fars_read_years(2013:2015)

test_that("Summary is list of Tibbles", {

  expect_is(farsSummary,"list")
  expect_is(farsSummary[[1]], "data.frame")


})

  system.file(package = "ggplot2")
