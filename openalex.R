# Access to OpenAlex API
# https://docs.openalex.org/
# https://api.openalex.org/institutions?filter=display_name.search:Norwegian%20Institute%20of%20Public%20Health
# FHI ID I1333353642

# pak::pkg_install("ropensci/openalexR")

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

injury <- list(
  entity = "works",
  abstract.search = "injury AND car AND older",
  publication_year = "2022",
  verbose = TRUE
)

do.call(oa_fetch, c(injury, list(count_only = TRUE)))

bb <- do.call(oa_fetch, injury)
bb
dim(bb)
typeof(bb)
names(bb)
class(bb)

bb$concepts[[1]]

bb |>
  show_works() |>
  knitr::kable()

bb1 <- oa_fetch(
  entity = "works",
  abstract.search = c("injury", "older"),
  publication_year = "2022") |>
  show_works() |>
  knitr::kable()

works_search <- oa_fetch(
  entity = "works",
  title.search = c("bibliometric analysis", "science mapping"),
  cited_by_count = ">50",
  from_publication_date = "2020-01-01",
  to_publication_date = "2021-12-31",
  options = list(sort = "cited_by_count:desc"),
  verbose = TRUE
)

works_search |>
  show_works() |>
  knitr::kable()


oa_fetch(
  entity = "works",
  title.search = c("pedestrian", "transport"),
  cited_by_count = ">50",
  from_publication_date = "2020-01-01",
  to_publication_date = "2021-12-31",
  options = list(sort = "cited_by_count:desc"),
  count_only = FALSE
) |>
  show_works() |>
  knitr::kable()
