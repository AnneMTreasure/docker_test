# adapted from https://github.com/jdtrat/tokencodr-google-demo
# also see https://tokencodr.jdtrat.com/articles/tokencodr.html

# remotes::install_github("jdtrat/tokencodr")
library(tokencodr)
library(googlesheets4)

# Run once and copy password to .Renviron
# Added this to GitHub repository secrets, with the name "DOCKER_GSHEET_ACCESS"
# just copy the password to the secret
tokencodr::create_env_pw("DOCKER_GSHEET_ACCESS")

## copy the password in the console. Then, paste this to the .Renviron file:
usethis::edit_r_environ()
# end .Renviron with a new line, save and close
# RESTART R

# Assumes the JSON file is a Google Service Account as described here:
# https://gargle.r-lib.org/articles/get-api-credentials.html#service-account-token
# the encrypted json file saved in .secrets folder in GitHub repo
tokencodr::encrypt_token(service = "DOCKER_GSHEET_ACCESS",
                         input = "~/src/dockertest-357706-eb5475d7b0a7.json", 
                         destination = "~/src/docker_test/")

# Locally Authenticate Google Sheets & Google Drive
googlesheets4::gs4_auth(path = tokencodr::decrypt_token(service = "DOCKER_GSHEET_ACCESS",
                                                        path = ".secret/DOCKER_GSHEET_ACCESS",
                                                        complete = TRUE))

