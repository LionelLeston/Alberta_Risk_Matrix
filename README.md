# Mig Birds Matrix / BC VRI models

Welcome to Nicole's BC models built in collaboration with Canfor and West Fraser!

This series of scripts is intended to help anyone replicate Nicole's analyses if they have: 
1. A Risk Matrix
2. Bird data for the region the risk matrix covers

## Background

This project is a collaboration between the Boreal Avian Modelling Project (BAM), BC forest products companies, and CWS. It was funded by a Mitacs Accelerate grant with Canfor and West Fraser. 

The primary goal was to evaluate a Stand Ranking Matrix created by the BC forest products companies. 

The secondary goal was to create an alternative to the Stand Ranking Matrix using predicted bird densities. 

## What's in this repo?

* Scripts, typically written in RMarkdown (Rmd files)
* Readmes meant to accompany the scripts

Nicole uses RMarkdown because it produces reports containing detailed (formatted) comments, headings, explanations, code, and output result. If you're open to using RMarkdown, it is suggested you do so. You can convert Rmd files to R scripts using 'tangle=T'. But this strips all preamble from the script, making it basically uncommented. 

`library(knitr)`
`knit("munge/00.02.FixorCalculateOffsets.Rmd", tangle=T)`


## What's not in this repo?

* Data
* Metadata
* Reports (html, doc)
* Images, figures, etc. 


## What to do next

#### Running these scripts as-is

To replicate these exact analyses on the same dataset Nicole used, you must access the scripts and the associated data. 

1. Access data via the Dropbox folder - request access from Nicole 

2. Fork the Repo into your own GitHub profile to access scripts


#### Adapting these analyses for other dataset(s)

If you want to apply these scripts to another dataset, you'll need to understand and modify the scripts. Nicole thinks you may want to access the data so you can test and understand what the scripts are meant to do, but it's probably not strictly necessary. Nicole has tried to note what types of data files are required for each script. 

1. Fork the Repo into your own GitHub profile to access scripts

2. If you decide to use data, request access to the Dropbox folder. 


## Workflow

Nicole's workflow breaks down into the following major steps. 


A. Data quality checking

B. Data manipulation & description

C. Sampling gap analysis

D. Description of rank patterns with forest attributes

E. Description of bird density patterns

F. Evaluation of predictive ability of ranking matrix

G. Bird-habitat density model (BRT)

H. Matrix derivation


Ideally, if you have the data, you should be able to replicate Nicole's analyses by proceeding from A through G, which are all saved in separate sub-folders. This workflow is as yet untested (Aug 20, 2018). 

**Note for Lionel on August 20, 2018: Right now I'm providing cleaned scripts for D-H so you can replicate the BC analyses in AB. I'll provide RData files of pre-manipulated, pre-checked data so you can test my scripts and see how they work. Then you can adapt for your AB datafiles**

**To that end, Lionel, you should skip right to folder D**





