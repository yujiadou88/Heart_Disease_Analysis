library(here)

here::i_am(
  "Code/render_report.R"
)

rmarkdown::render(
  here("Heart_Disease_Analysis.Rmd")
)
