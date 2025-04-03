
all: clean_data figures model report

clean_data:
	Rscript Code/clean_data.R

figures:
	Rscript Code/figures.R

model:
	Rscript Code/model.R

report:
	Rscript Code/render_report.R


.PHONY: clean
clean:
	rm -f Data/data_hd_cleaned.csv output/*.csv output/*.png *.html *.pdf *.docx


