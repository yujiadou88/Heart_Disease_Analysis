# Heart Disease Risk Factor Analysis

## Steps for analysis and associated codes

This project investigates potential risk factors for heart disease using a binomial logistic regression model and visualizations of key variables. 

The analysis is performed as follows:

1. Data cleaning: clean the raw data and save the cleaned data, performed by `Code/clean_data.R`.

2. Descriptive Analysis: generate a table 1 for describing the population, performed by `Heart_Disease_Analysis.Rmd`.

3. Exploratory Analysis: generate and save plots to present associations between variables, performed by `code/figures.R`.

4. Model fitting: fit a logistic regression model to explore the associations between heart disease status and other risk
factors, summarize and save the model results, performed by `Code/model.R`.

---

## Repository structure

```
.
├── Code/                           # R scripts for each step of analysis
│   ├── clean_data.R                # Cleans the raw data
│   ├── model.R                     # Fits the logistic regression model
│   ├── figures.R                   # Generates and saves required figures
│   └── render_report.R             # Renders the final report
│
├── Data/
│   ├── heart_disease.csv           # Raw input dataset 
|   ├── data_hd_cleanded.csv        # Cleanded dataset
│
├── output/
│   ├── model_results.csv           # Summary table of final logistic model
│   ├── stress_level_plot.png       # Bar plot of stress level by heart disease status
│   ├── cholesterol_level_plot.png  # Boxplot of cholesterol by heart disease status
│
├── Heart_Disease_Analysis.Rmd      # Final report (renders to HTML/PDF/Docx)
├── Makefile                        # Automates full workflow
├── .gitignore                      # Prevents tracking of outputs and temp files
└── README.md                       # This file
```

---

## Instructions for creating the report from terminal

### Option 1: Use `make`

```bash
make
```

### Option 2: Run each step manually

```bash
Rscript Code/clean_data.R
Rscript Code/model.R
Rscript Code/figures.R
Rscript Code/render_report.R
```

---
