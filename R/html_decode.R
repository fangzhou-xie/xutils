#' Decode a character vector
#'
#' This function is a wrapper around existing C++ code on decoding HTML entities.
#' The original C++ code is given by Christoph. Please refer to the answer on SO
#' [here](https://stackoverflow.com/a/1082191/10437891).
#'
#' @param str A character vector
#' @return Decoded character vector
#' @examples
#' html_decode(c("&amp;", "&euro;"))
#' @export
html_decode <- function(str) {

  strlong <- paste0(str, collapse = "#_|")
  parsed <- html_decode_rcpp_single(strlong)
  strsplit(parsed, "#_|", fixed = TRUE)[[1]]
}
