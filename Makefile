Heart_Disease_Analysis.html: Data/data_hd_cleaned.csv Code/render_report.R Heart_Disease_Analysis.Rmd Output/*.png Output/model_result.csv
	Rscript Code/render_report.R
	
Data/data_hd_cleaned.csv: Code/clean_data.R Data/heart_disease.csv
	Rscript Code/clean_data.R

Output/*.png: Code/figures.R Data/data_hd_cleaned.csv
	Rscript Code/figures.R

Output/model_result.csv: Code/model.R Data/data_hd_cleaned.csv
	Rscript Code/model.R

.PHONY: clean
clean:
	rm -f Data/data_hd_cleaned.csv output/*.csv output/*.png report/*.html

install:
	Rscript -e 'renv::restore()'
	
	
# build hd_image
build_image: Dockerfile
	docker build -t yujiadou88/hd_image .

# render report in container
docker_report:
	docker run -v "$(pwd)/final_report:/project/final_report" yujiadou88/hd_image

docker_report_win:
	docker run -v "/$$(pwd)/final_report:/project/final_report" yujiadou88/hd_image

