library(xutils)

test_that("symbols decoded correctly", {
  expect_equal(html_decode(c("abcd", "&amp; &apos; &gt;", "&amp;", "&euro; &lt;")), c("abcd", "& ' >", "&" , "€ <"))
})
