#' Create FARS data specific filename
#'
#' A helper function to create a filename that follows the convention for FARS data
#'
#' @param year A character vector specifiying the year to be used in the filename
#'
#' @return A character vector that follows the file name convention for FARS data
#'
#' @examples
#' make_filename(2019)
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
