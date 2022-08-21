# Computational methods evaluation - Cytotoxicity of Triclabendazol in THP-1 cells

This repository contains a data analysis for the evaluation of computational abilities learned during the Computational methods discipline of the Training Program in Quantitative Biology and Ecology.

### Project context

This project consists of a dataset analysis generated for a project on drug repurpusing for Leishmaniasis treatment. The main goal is to set a log-logistic model fit to THP-1 cells exposed to triclabendazol, calculate the half maximal inhibitory concentration (IC50) and use this result to identify the selectivity index of this drug for the parasites. in future analysis.

### About the Dataset

Raw data consist of absorbance reads of three experiments of MTT assays performed on 96-well plates in THP-1 differentiated macrophages. More details about data collection and experimental conditions can be found in the final report.

### Data source

This data were produced by Beatris S. Borges, a PhD student, in the Cell Biology lab at Instituto Carlos Chagas - FIOCRUZ/PR.

## Project structure

        project/ 
          *   ├── data/ 
          *   │   ├── raw 
              │   └── processed
              ├── functions/
              ├── R/
              ├── docs/ 
              ├── figs/
              └── README.md

In the <data> folder are located the raw and processed datasets. In the `functions` you will find the functions created for some steps of analysis. The `R` directory holds all scripts. Figures outputs can be found in the `figs` folder, and you can find the markdown report in `docs` folder.

# Requirements

    * library(plater) 
    * library(dplyr)
    * library(ggplot)
    * library(scales) 
    * library(stats) 
    * library(skimr) 
    * library(rstatix) 
    * library(drc) 
