# Computational methods evaluation - Cytotoxicity of Triclabendazol in THP-1 cells

Welcome! This repository contains a data analysis for the evaluation of computational abilities learned during the Computational methods discipline of the Training Program in Quantitative Biology and Ecology.

## Project context

Drug repurposing is one of the most important strategies for saving time and money in the discovery of new therapies for neglected infectious diseases. Triclabendazole (TCBZ) is an approved drug to treat human fasciolosis and it has already shown antiproliferative activity against T. cruzi, T. brucei, and L. infantum. More investigations about this drug in other parasites of the genus leishmania can elucidate if the TCBZ is a good candidate for the treatment of different kinds of leishmaniasis and test whether it has a synergic effect to be implemented as an adjuvant to reduce the dose of toxic compounds already used to treat leishmaniasis.  
Cytotoxicity assays are one additional step performed in drug development and also in drug repurposing. It consists of a viability assay in a host cell model such as THP-1 monocytes differentiated in macrophages. This experiment provides a way to compare the selectivity of a compound to act on the parasite instead of the host cell. The data used in this evaluation corresponds to the results of viability assays to check the toxicity of TCBZ in THP-1 cells in the context of TCBZ repurposing evaluation for cutaneous leishmaniasis.

## Methods

Viability assays using MTT (3-(4,5-dimethylthiazol-2-yl)-2,5- diphenyltetrazolium bromide) are the most common and simple form of in vitro test compounds. MTT is a salt that is reduced form produces a colorimetric reaction that can be evaluated by absorbance. The reduction is proportional to viable cell mitochondria reduction activity. So, as a result of exposure to different compound concentrations, it is possible to fit a drug response curve and evaluate metrics of drug efficacy such as IC50.

## About the Dataset

Raw data consist of absorbance reads of three experiments of MTT assays performed on 96-well plates in THP-1 differentiated macrophages.

## Data source

This data were produced by Beatris S. Borges, a colaborator, in the Cell Biology lab at Instituto Carlos Chagas.

## Project structure

        project/ 
          *   ├── data/ 
          *   │   ├── raw │ 
              │   └── processed
              ├── docs/ 
              ├── figs/ 
              ├── R/ 
              ├── output/  
              └── README.md

In the `R` directory you will find the scripts.
