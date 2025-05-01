FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

# Create required directories
RUN mkdir Code Output Data final_report

# Copy project files
COPY Code Code
COPY Data/heart_disease.csv Data/
COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv/
COPY renv/settings.json renv/
COPY Makefile .
COPY Heart_Disease_Analysis.Rmd .

# Restore packages
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Create final report 
CMD make && mv Heart_Disease_Analysis.html final_report