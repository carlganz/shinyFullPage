#' HTML Wrappers
#'
#' @param id HTML id
#' @param ... Additional parameters passed onto \code{div}
#' @param options List of options see notes
#' @note \url{}
#' @importFrom jsonlite toJSON
#' @export
#'

sfp_fullpage <- function(id, ..., options = NULL) {
 
  call <- match.call()
  call[[1]] <-  htmltools::div
  shiny::tagList(shiny::tags$script(shiny::HTML(paste0(
    "$(document).ready(function() {",
    "$('#", id, "').fullpage(",
    jsonlite::toJSON(options)
    , ");",
    "})"
  ))),
  eval(call, parent.frame()))
}

#' @rdname sfp_fullpage
#' @export
#'

sfp_section <- function(...) {
  call <- match.call()
  call$class <- paste("section", call$class)
  call[[1]] <-  htmltools::div
  eval(call, parent.frame())
}

#' @rdname sfp_fullpage
#' @export
#'

sfp_slide <- function(...) {
  call <- match.call()
  call$class <- paste("slide", call$class)
  call[[1]] <-  htmltools::div
  eval(call, parent.frame())
}