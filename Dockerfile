FROM bioconductor/bioconductor_docker:RELEASE_3_15

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    libglpk-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libicu-dev \
    libssl-dev \
    openssl \
    libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
RUN dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

#RUN Rscript -e "devtools::install('.', dependencies=TRUE, build_vignettes=TRUE, repos=BiocManager::repositories())"
RUN Rscript -e "BiocManager::install('compbiomed/animalcules')"
