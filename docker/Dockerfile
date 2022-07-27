
FROM rocker/r-ver:4.1.3

LABEL maintainer="Anne Treasure"

#ARG message1 = "Running data for Kumu"

RUN mkdir scripts

COPY *.R scripts/

RUN Rscript scripts/docker_experi.R



