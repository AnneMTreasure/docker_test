
# docker test script

###### ---------- LOAD PACKAGES ---------- ######
library(tidyverse)
library(googlesheets4)

###### ---------- AUTHORISATIONS ---------- ######
# this works locally
#gs4_auth(email = "*@talarify.co.za", path = "~/docker_test/.secret/DOCKER_GSHEET_ACCESS")
#gs4_auth(email = "*@talarify.co.za", path = "~/docker_test/sheets_service_account_key.json") # before making the json a secret

# for GitHub Action (adapted from https://github.com/jdtrat/tokencodr-google-demo)
source("functions/func_auth_google.R")

# Authenticate Google Service Account (adapted from https://github.com/jdtrat/tokencodr-google-demo)
auth_google(email = "*@talarify.co.za",
            service = "DOCKER_GSHEET_ACCESS",
#            token_path = ".secret/DOCKER_GSHEET_ACCESS")
            token_path = "DOCKER_GSHEET_ACCESS")


###### ---------- READ DATA FROM GOOGLE SHEET ---------- ######
form_data <- read_sheet("https://docs.google.com/spreadsheets/d/1Uv0PQOn7jjpzQ2AyVpzUN_CulHjMpr8qsQMZehXmJ-c/edit#gid=0")


###### ---------- DATA MANIPULATION ---------- ######
sub1 <- form_data %>% 
  select(1:2, 1:2)

###### ---------- WRITE TO GOOGLE SPREADSHEET ---------- ######
ss = "https://docs.google.com/spreadsheets/d/1Uv0PQOn7jjpzQ2AyVpzUN_CulHjMpr8qsQMZehXmJ-c/edit#gid=0"

docker_test_gsheet <- sheet_write(sub1, ss = ss, sheet = "sub1")


###### ---------- WRITE RData FILE ---------- ######
save(docker_test_gsheet, file = "data/docker_test_gsheet.RData")

