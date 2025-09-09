# Pirates and Patentents Replication File

This repository contains historical patent data and replication code for the book *"PIRATES AND PATENTS: THE ROLE OF INTELLECTUAL PROPERTY IN THE DEVELOPMENT OF THE WESTERN WORLD"* by Petra Moser

> **Please cite the corresponding publication if you use any of the data.**

---
## 📁 Repository Structure
We have the following project layout:

```text
/
├── data/                # Raw data files (e.g., .csv, .xlsx, .dta)
├── code/                # Analysis scripts (e.g., .R, .py)
└── README.md            # Project documentation
```

## Data Files for Figures and Tables

| **Data Description** | **Data File** | **Publication** |
|----------------------|---------------|------------------|
| Number of patent applications and sealed patents in Great Britain between 1614 and 1932| `Brit_patents_app_sealed1617-1938.xlsx` | *Mitchell, Brian R. British historical statistics. CUP Archive, 1988.* |
| General innovation and patent data | *(Not specified)* | *Innovation and Patents.* *Oxford Handbook of Economic History*, forthcoming. |
| Data on patents, hybrids, citations, and yield improvements | `patents_with_improvements_in_yields.xlsx` | *Patent Citations - An Analysis of Quality Differences and Citing Practices in Hybrid Corn*, *Management Science*, 2018. |
| German chemical patents, 1900–1930 | `germ_pat_130906.dta` | *Compulsory Licensing and Innovation - Evidence from German Patents after WWI*, *JDE*, 2017. |
| Data on patent pools in 20 industries under the New Deal | `jleo_data150617.dta` | *Patent Pools, Competition and Innovation*, *JLEO*, 2016. |
| US sewing machine industry patent pools | `RJE_data140123.dta` | *Patent Pools and Innovation in Substitute Technologies*, *RAND Journal*, 2014. |
| Chemical patent datasets (main, primary classes, indigo subset) | `chem_patents_maindataset.dta`<br>`chem_patents_primaryclassesdataset.dta`<br>`chem_patents_indigodataset.dta` | *Compulsory Licensing: Evidence from the Trading with the Enemy Act*, *AER*, 2012. |
| Crystal Palace Fair prize data, 1851 | `Awards1851_German.xlsx` | *Prizes, Publicity, and Patents*, *JIE*, 2013. |
| British exhibits and prizes, 1851. Note: for location-based analyses, if a city does not have population it is considered a rural place. | `Britain1851.xls` | *Innovation without Patents – Evidence from World’s Fairs*, *JLE*, 2012. |
|  | *(See file above)* | *Did Plant Patents Create the American Rose?*, in *The Rate and Direction of Technological Change*, 2012. |
|  | *(See file above)* | *Patent Pools: Licensing Strategies in the Absence of Regulation*, *Advances in Strategic Management*, 2012. |
| Britain 1851 exhibits with location data | `Britain1851.xls` | *Do Patents Weaken the Localization of Innovations?*, *JEH*, 2011. |
| France 1851 exhibits with location data | `FrenchExibits_w_locations.xlsx` | *Do Patents Weaken the Localization of Innovations?*, *JEH*, 2011. |
| Sewing machine patent pools – main data | `JEH_data140123.dta` | *Do Patent Pools Encourage Innovation?*, *JEH*, 2010. |
| Stitches per minute data | `stitch_data140124.xls` | *Do Patent Pools Encourage Innovation?*, *JEH*, 2010. |
| All prize data, Crystal Palace 1851 | `Awards1851_German.xlsx` | *How Do Patent Laws Influence Innovation?*, *AER*, 2005. |
| Regression data for same study | `rpat509rep.xls` | *How Do Patent Laws Influence Innovation?*, *AER*, 2005. |
| Britain 1851 exhibits (individual-level) | `Britain1851.xls` | *How Do Patent Laws Influence Innovation?*, *AER*, 2005. |
| France 1851 exhibits (individual-level) | `FrenchExibits_w_locations.xlsx` | *How Do Patent Laws Influence Innovation?*, *AER*, 2005. |
| *(General reference)* | *(Not specified)* | *Was Electricity a General Purpose Technology?*, *AER Papers & Proceedings*, 2004. |
---

## Data Files for Replication Code
| **Code Description** | **Code File** | **Data File(s) Used** |
|----------------------|---------------|-----------------------|
|Replication of Figure 1.4 | `Figure_1.4.R` | Brit_patents_app_sealed1617-1938.xlsx|
---

## Notes

- Some data files appear in multiple studies; cite all relevant publications.
- File names are retained as originally released.
- Publications include coauthors where applicable.

---
