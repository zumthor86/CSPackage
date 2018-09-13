#' Read FARS csv data
#'
#' @param filename A character vector specifiying the FARS csv file in the current working directory to read
#'
#' @return A tibble containing the FARS data
#'
#' @examples
#' fars_read("accident_2013.csv.bz2")
#'
#' @note Gives an error if filename that is passed doesn't exist in current working directory
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}

