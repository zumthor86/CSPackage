#' Produce a map plot of fatalities for a given state and year
#'
#' @param state.num An integer corresponding to the state number of the state for which a map plot should be drawn
#' @param year An integer specifying the year for which the map plot should be drawn
#'
#' @return NULL
#' @examples
#' fars_map_state(44,2015)
#' @note An error is thrown if the state number is invalid
#' @note A warning is given if given state did not have any fatalities for that year
#' @note Requires the map package and dplyr package
#'
#' @importFrom dplyr filter
#' @importFrom dplyr maps map
#' @importFrom graphics points
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
