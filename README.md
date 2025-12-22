# Pirates and Patents Replication File

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
|Individual exhibits, countries, and prices for 1815 and 1876 Britain and US Exhibits| `rpat100513.xls`| *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236*|
|Exhibits for US 1876 exhibits| `usa1851_JO90724.xls`| *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236*|
| British exhibits and prizes, 1851. Note: for location-based analyses, if a city does not have population it is considered a rural place. | `Britain1851.xls` | *Innovation without Patents – Evidence from World’s Fairs*, *JLE*, 2012. |
|Industry labels per class number | `industry.dta` | *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236* | 
|Number of British and US patents per year. Note: Shares of sewing-machine patents per country per year year are included. British patents don't include tables and stands. US patents exclude attachments and tables | `sewing_machines906022.xls` tab: `sm pat total` | *Do Patent Pools Encourage Innovation?  Evidence from the 19th-Century Sewing Machine Industry with Ryan Lampe.  The Journal of Economic History, Volume 70, Issue 04, December 2010, pp. 898-920.* |
|US exhibits for 1851 Great Exhibit in London | `usa1851_census.xls` | *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236* |
| Data on patent pools in 20 industries under the New Deal | `jleo_data150617.dta` | *Patent Pools, Competition and Innovation*, *JLEO*, 2016. |
| US sewing machine industry patent pools | `RJE_data140123.dta` | *Patent Pools and Innovation in Substitute Technologies*, *RAND Journal*, 2014. |
| Sewing machine patent pools – main data | `JEH_data140123.dta` | *Do Patent Pools Encourage Innovation?*, *JEH*, 2010. |
---

## Data Files for Replication Code
| **Code Description** | **Code File** | **Data File(s) Used** |
|----------------------|---------------|-----------------------|
|Replication of Figure 1.4 | `Figure_1.4.R` | `Brit_patents_app_sealed1617-1938.xlsx`|
|Replication of Figure 3.1 |  `Figure_3.1.R` | `rpat100513.xls`|
|Replication of Figure 3.3 |  `Figure_3.2.R` | `rpat100513.xls`|
|Replication of Figure 4.3 |  `Figure_4.3.R` | `usa1851_JO90724.xls`|
|Replication of Figure 5.1 |  `Figure_5.1.R` | `rpat100513.xls`|
|Replication of Figure 5.5 |  `Figure_5.5.R` | `rpat509rep.xls`|
|Replication of Figure 7.1 |  `Figure_7.1.R` | `sewing_machines906022.xls`, sheet = `Tab sm pat total pat`|
|Replication of Figure 7.2 |  `Figure_7.2.R` | `RJE_data140123.dta`|
|Replication of Table 3.1 |  `Table_3.1.R` | `rpat100513.xls`|
|Replication of Table 4.1 |  `Table_4.1.R` | `Britain1851.xls`, `rpat100513.xls`, and `usa1851_census.xls`|
|Replication of Table 4.2 |  `Table_4.2.R` | `industry.dta` and `Britain1851.xls`|
|Replication of Table 5.1 |  `Table_5.1.R` | `usa1851_JO90724.xls`, `Britain1851.xls`, and `industry.dta`|
|Replication of Table 5.3 |  `Table_5.3.R` | `Britain1851.xls` and `industry.dta`|
|Replication of Table 7.2 |  `Table_7.2.R` | `pools111203b.xlsx`, sheet = `pool_chars.csv`|
---

## Sources for Exhibition Data
Data for Moser (2003, 2005) were originally collected from two official catalogues and one commission report available at the UC Berkeley Library (1997–2002). For this book, the dataset has been extended with revised editions accessible through Google Books, including the Third and Revised Edition of the Official Catalog of the International Exhibition of 1876, the Swiss Catalogue of the International Exhibition 1876 Philadelphia, and the Special Catalogue of the Netherland Section.

- 1851 Exhibits: Royal Commission. Official Catalogue of the Great Exhibition of the Work of Industry of All Nations 1851, Third Corrected and Improved Edition. London: Spicer Brothers, 1851.
- 1876 Exhibits: United States Centennial Commission. International Exhibition 1876 Official Catalogue, Second and Revised Edition. Philadelphia: John R. Nagle and Company, 1876.
- 1851 Awards: Berichterstattungs-Kommission der Deutschen Zollvereins-Regierungen. Amtlicher Bericht über die Industrie-Austellung aller Völker zu London im Jahre 1851. Vols. I–III. Berlin: Verlag der Deckerschen Geheimen Ober-Hofbuchdruckerei, 1852–1853.

## Patenting Rate in Urban vs. Rural Areas Data
Data for US exhibits in 1876 for the Centennial fair, found in `usa1851_JO90724.xls`, includes the patenting rates across Britain and the United States for both rural and urban areas. Since place names change over time, I use historical gazetteers like *Bartholomew’s Gazetteer of the British Isles* (1887) to identify towns whose names or borders have changed. Matching locations with population data from the British census yield city size for 5,317 (83.4 percent) of British exhibits. Since cities and towns that do not show up in the census are very likely to be small, I assign them to towns with fewer than 10,000 people. To control for historical border changes within London, I assign districts (such as Clerkenwell and Islington) that are part of London today to the City of London and maintain the record of their district name.


## Primary Sources
This folder includes copies of the historical sources relating to the Copyright Law in 1801. 

| **File** |     **Source**     |      **Description**     |   **Citation**  |
|----------|--------------------|--------------------------|-----------------|
|`French_Copyright_Law_1793.png`|Code du Commerce, ou Recueil de Lois, Réglemens et Arrêtés, pour les Tribunaux de Commerce (1799)|Photocopy of the French Chénier Act in July 19th, 1793. This granted authors of all genres, composers, and painters the exclusive rights to sell their work and extends the rights for 10 years after the death of authors.|Giorcelli & Moser 2020, Appendix B, p. 32|
|`Copyright_Law_Cisalpine_Republic_1801.pdf`|Legge N. 423 19 Fiorle Anno IX Repubblicano, Raccolta delle leggi, proclami, ordini ef avvisi pubblicati in Milano dal giorno 13 Peatile anno VII, n. 144, Milano, 1801|Official collection of laws and decrees issued in Milan during the late Cisalpine Republic that encompassed parts of northern Italy, specifically Lombardy and Venetia. Article 1 provides copyrights to authors of every kind. Article 2 provides hereditary rights to heirs or assignees for 10 years after the author's death.|Giorcelli & Moser 2020, p. 4170|
|`papal_state_literacy_scientific_work_1826.pdf`|Editio N. 433, 28 Settembree, 1826|Transcript of the official copyright law in papal state in 1826|Giorcelli & Moser 2020, Appendix B, pp. 39-40|
|`sicily_intellectual_property_1828.pdf`|REGIO DECRETO NO. 1904, 5 FEBBRAIO, 1828|Transcript of the official copyright law in the Kingdom of Two Scicilies in 1828|Giorcelli & Moser 2020, Appendix B, p. 40|
|`bileteral_treaty_austria_1840.pdf`|CONVENZIONE 22 MAGGIO 1840 SEGUITA TRA SUA MAESTÀ IL RE DI SARDEGNA E L’IMPERATORE D’AUSTRIA A FAVORE DELLA PROPRIETÀ E CONTRO LA CONTRAFFAZIONE DELLE OPERE SCIENTIFICHE, LETTERARIE E ARTISTICHE|Transcript of the Bilateral Treat with Austria in 1840. This treaty granted property rights to literary and artistic works with an extension of 30 years after author's death|Giorcelli & Moser 2020, Appendix B, pp. 40-44|
|`italy_copyright_1865.pdf`|LEGGE 25 GIUGNO 1865 NO. 2337 SUI DIRITTI SPETTANTI AGLI AUTORI DELLE OPERE DELL’INGEGNO|Italian Copyright Law of 25 June 1865, No. 2337. Issued under Vittorio Emanuele II, it consolidated Italy's first national copyright statute after unification. These laws were downloaded from Uberatzzi (law firm) back in 2013. The website is no longer available but we are making the transcription available here.|Giorcelli & Moser 2020, Appendix B, pp. 41-45|
|`carte_sciolte6268.png`|Archivio Storico Della Cità di Torino (ACS), Carte Sciolte (1111-1848)|Transcript for opera composition between Francesco Bendetto Ricci and Giuseppe Mosca, Teatro Alla Scala in Milano, January 16, 1802|Giorcelli & Moser 2020, Appendix B, p. 20|
|`carte_sciolte6261.png`|Archivio Storico Della Cità di Torino (ACS), Carte Sciolte (1111-1848)|Letter from the impresario Angelo Petracchi to the composer Giovanni Pacini, Treatro Alla Scala in Milano, December 12, 1819|Giorcelli & Moser 2020, Appendix B, p. 23|
|`carte_sciolte6253.png`|Archivio Storico Della Cità di Torino (ACS), Carte Sciolte (1111-1848)|Letter from the composer Stefano Pavesi to the impresatio Giacomo Pregliasco of the Teatro Regio in Torino, November 3, 1803|Giorcelli & Moser 2020, Appendix B, p. 22|
 
## Notes

- Some data files appear in multiple studies; cite all relevant publications.
- File names are retained as originally released.
- Publications include coauthors where applicable.

---
