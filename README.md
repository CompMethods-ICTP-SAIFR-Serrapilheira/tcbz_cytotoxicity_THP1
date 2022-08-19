# Computational methods evaluation - Cytotoxicity of Triclabendazol in THP-1 cells

Welcome! This repository contains a data analysis for the evaluation of computational abilities learned during the Computational methods discipline of the Training Program in Quantitative Biology and Ecology.

### Project context

This project consist of data analysis of one of the datasets generated to a project of drug reporpusing for Leishmaniasis treatment. The main goal is to set a log logistic model fit to THP-1 cells exposed to triclabendazol, calculate the half maximal inhibitory concentration (IC50) and use this result to identify the seletivety index of this drug for the parasites. in future analysis.

### About the Dataset

Raw data consist of absorbance reads of three experiments of MTT assays performed on 96-well plates in THP-1 differentiated macrophages. More details about data collection and experimental conditions can be found on the report

### Data source

This data were produced by Beatris S. Borges, a colaborator, in the Cell Biology lab at Instituto Carlos Chagas.

## Project structure

        project/ 
          *   ├── data/ 
          *   │   ├── raw 
              │   └── processed
              ├── docs/ 
              ├── figs/ 
              ├── R/
              ├── functions/
              └── README.md

In the `R` directory you will find the scripts. In the docs folder you can find the markdown report.
