#' Produce summary table of fatalities by month and year
#'
#' A function to summarize the number of fatal injuries from car crashes for a given number of years, broken down by month
#'
#' @param years An integer vector specifying years of data to summarize
#'
#' @return A summary table giving the number of fatal injuries from crashes, by month and year
#' @examples
#' \dontrun{
#' fars_summarize_years(c(2013:2015))
#' }
#'
#' @importFrom dplyr bind_rows group_by_ summarize_
#' @importFrom tidyr spread_
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by_(year, MONTH) %>%
    dplyr::summarize_(n = n()) %>%
    tidyr::spread_(year, n)
}
