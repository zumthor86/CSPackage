#' Read FARS data for multiple years
#'
#' A helper function to read FARS data for multiple years
#'
#' @param years An integer vector specifying years of data read
#'
#' @return A list containing a tibble for each year, with only the MONTH and year columns
#'
#' @examples
#' \dontrun{
#' fars_read_years(c(2013:2015))
#' }
#'
#'
#' @note Produces a warning if the one of the years passed was invalid, i.e. does not exist in working directory or format of years was incorrect
#'
#' @importFrom dplyr mutate_ select_
#' @importFrom magrittr %>%
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate_(dat, year = ~year) %>%
        dplyr::select_(.dots = c("MONTH", 'year'))
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
