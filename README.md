# xutils

A package that contains some useful functions.


# Best performing R function that deals with HTML entities

Currently, there is only one function `html_decode` and it ourperforms several competing solutions.

### Solution 1:

```
unescape_html2 <- function(str){
  html <- paste0("<x>", paste0(str, collapse = "#_|"), "</x>")
  parsed <- xml2::xml_text(xml2::read_html(html))
  strsplit(parsed, "#_|", fixed = TRUE)[[1]]
}
```

### Solution 2:

```
textutils::HTMLdecode()
```

### **Solution 3**:
```
xutils::html_decode()
```

### Comparison

```{r}
bench::mark(
  html_decode(strings),
  unescape_html2(strings),
  textutils::HTMLdecode(strings)
)

# A tibble: 3 x 13
  expression                          min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc total_time result memory
  <bch:expr>                     <bch:tm> <bch:tm>     <dbl> <bch:byt>    <dbl> <int> <dbl>   <bch:tm> <list> <list>
1 html_decode(strings)             6.85µs   8.04µs   100250.    8.88KB     10.0  9999     1     99.7ms <chr … <Rpro…
2 unescape_html2(strings)        103.38µs 108.99µs     8976.   71.77KB     29.5  3957    13    440.9ms <chr … <Rpro…
3 textutils::HTMLdecode(strings)   4.43ms   4.58ms      216.  340.45KB     62.8    69    20    318.7ms <chr … <Rpro…
# … with 2 more variables: time <list>, gc <list>
```

Please refer to the vignettes for more details.
