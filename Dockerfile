
#FROM rocker/r-ver:4.1.3

FROM rocker/tidyverse:4.0.0 
#has R version 4.0.0 and the tidyverse packages preinstalled

LABEL maintainer="Anne Treasure"

# This installs many of the linux libraries needed for the subsequent R packages to work. 
# Also installed some useful utility packages like curl, jq and vim
RUN apt-get update && apt-get install -y --no-install-recommends \
        libgit2-dev \
        libxml2-dev \
        curl \
        tree \
        jq \
        htop \
        texinfo \
        vim \
        man-db \
        less

# set the MRAN Build Date and then install the R packages needed using install2.r 
# with the -r argument to point to MRAN Time Machine instead of CRAN
ENV MRAN_BUILD_DATE=2022-01-01

# Install R Packages
RUN install2.r -r https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE} \
    --error \
    googlesheets4

RUN --mount=type=secret,id=GITHUB_TOKEN \
  --mount=type=secret,id=DOCKER_GSHEET_ACCESS_PASSWORD \
   export GITHUB_TOKEN=$(cat /run/secrets/GITHUB_TOKEN) && \
   export DOCKER_GSHEET_ACCESS_PASSWORD=$(cat /run/secrets/DOCKER_GSHEET_ACCESS_PASSWORD) && \
   yarn gen

#RUN mkdir scripts

#COPY *.R scripts/

#RUN Rscript scripts/docker_test_script1.R
#RUN Rscript scripts/docker_experi.R


