
FROM rocker/r-ver:4.1.3

LABEL maintainer="Anne Treasure"

#ARG message1 = "Running data for Kumu"

ENV MRAN_BUILD_DATE=2022-01-01

# Example of a conventional `install.packages()` approach 
RUN Rscript -e "install.packages('tidyverse', repos = 'https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE}')"
RUN Rscript -e "install.packages('googlesheets4', repos = 'https://cran.microsoft.com/snapshot/${MRAN_BUILD_DATE}')"

RUN mkdir scripts

COPY *.R scripts/

RUN Rscript scripts/docker_experi.R



