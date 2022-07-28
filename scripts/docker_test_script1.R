
# docker test script

###### ---------- LOAD PACKAGES ---------- ######
library(tidyverse)
library(googlesheets4)

###### ---------- AUTHORISATIONS ---------- ######
# this works locally
#gs4_auth(email = "*@talarify.co.za", path = "~/stakeholder_map/.secret/DOCKER_GSHEET_ACCESS")
#gs4_auth(email = "*@talarify.co.za", path = "~/stakeholder_map/sheets_service_account_key.json") # before making the json a secret

# for GitHub Action (adapted from https://github.com/jdtrat/tokencodr-google-demo)
source("functions/func_auth_google.R")

# Authenticate Google Service Account (adapted from https://github.com/jdtrat/tokencodr-google-demo)
auth_google(email = "*@talarify.co.za",
            service = "DOCKER_GSHEET_ACCESS",
            token_path = ".secret/DOCKER_GSHEET_ACCESS")


###### ---------- READ DATA FROM GOOGLE SHEET ---------- ######
form_data <- read_sheet("https://docs.google.com/spreadsheets/d/1Uv0PQOn7jjpzQ2AyVpzUN_CulHjMpr8qsQMZehXmJ-c/edit#gid=0")


###### ---------- DATA MANIPULATION ---------- ######
sub1 <- form_data %>% 
  select(1:2, 1:2)

###### ---------- WRITE TO GOOGL SPREADSHEET ---------- ######

##### write to google spreadsheet
ss = "https://docs.google.com/spreadsheets/d/1Uv0PQOn7jjpzQ2AyVpzUN_CulHjMpr8qsQMZehXmJ-c/edit#gid=0"

docket_test_gsheet <- sheet_write(sub1, ss = ss, sheet = "sub1")
