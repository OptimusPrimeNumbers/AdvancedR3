usethis::use_data_raw("cv-risk")
3cv_risk_path <- here::here("data", "cv-risk.csv")
if (!fs::file_exists(cv_risk_path)) {
  download.file(
    "https://r-cubed-advanced.rostools.org/data/cv-risk.csv",
    destfile = cv_risk_path,
    # For in Windows users.
    mode = "wb"
  )
}
readr::read_csv(here::here("data/cv-risk.csv"))
git_ci(
  c("data-raw/cv-risk.R", "data/cv-risk.csv"),
  "Download data into data folder"
)
styler::style_dir()
gert::git_add(".")
gert::git_commit("Download and save data")
