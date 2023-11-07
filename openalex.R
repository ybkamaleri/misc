# Access to OpenAlex API
# https://docs.openalex.org/
# https://api.openalex.org/institutions?filter=display_name.search:Norwegian%20Institute%20of%20Public%20Health
# FHI ID I1333353642

pak::pkg_install("ropensci/openalexR")

library(openalexR)

# FHI authors published more than 200 articles
fhiAuthors <- list(
  entity = "authors",
  last_known_institution.id = "I1333353642",
  works_count = ">200")

do.call(oa_fetch, c(fhiAuthors, list(count_only = TRUE)))

if (do.call(oa_fetch, c(fhiAuthors, list(count_only = TRUE)))[1]>0){
  do.call(oa_fetch, fhiAuthors) |>
    show_authors() |>
    knitr::kable()
}
