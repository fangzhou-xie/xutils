
#' decode a single element character vector
#' using Christoph's C++ code
#' https://stackoverflow.com/a/1082191/10437891
#' @param str A single string
#' @return decoded string
#' @examples
#' html_decode("&amp;")
#' @export
html_decode <- function(str) {

  strlong <- paste0(str, collapse = "#_|")
  parsed <- html_decode_rcpp_single(strlong)
  strsplit(parsed, "#_|", fixed = TRUE)[[1]]
}
