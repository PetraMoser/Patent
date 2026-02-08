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
| Individual exhibits, countries, and prices for 1815 and 1876 Britain and US Exhibits| `rpat100513.xls`| *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236*|
| Prize-winning exhibitions on the publication *Scientific American* and prize-winning exhibits on the Crystal Palace Fair of 1851. | `pat_prize_sciam_cit.dta` | *Prizes, Publicity, and Patents – Non-Monetary Awards as a Mechanism to Encourage Innovation*, with Tom Nicholas. Journal of Industrial Economics, 2013 Volume 61: pp. 763–788. |
| Number of innovations per country for the 1851 Great Exhibition (London, Crystal Palace) and the 1876 Centennial Exhibition (Philadelphia). Includes GDP and patent-length information. | `rpat509rep.xls` | *Innovation without Patents – Evidence from World’s Fairs*, The Journal of Law and Economics, Volume 55, No. 1, February 2012, pp. 43-74. |
| Exhibits for US 1876 exhibits| `usa1851_JO90724.xls`| *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236*|
| British exhibits and prizes, 1851. Note: for location-based analyses, if a city does not have population it is considered a rural place. | `Britain1851.xls` | *Innovation without Patents – Evidence from World’s Fairs*, *JLE*, 2012. |
| Industry labels per class number | `industry.dta` | *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236* | 
| Number of British and US patents per year. Note: Shares of sewing-machine patents per country per year year are included. British patents don't include tables and stands. US patents exclude attachments and tables | `sewing_machines906022.xls` tab: `Tab sm pat total pat` | *Do Patent Pools Encourage Innovation?  Evidence from the 19th-Century Sewing Machine Industry with Ryan Lampe.  The Journal of Economic History, Volume 70, Issue 04, December 2010, pp. 898-920.* |
| US exhibits for 1851 Great Exhibit in London | `usa1851_census.xls` | *How Do Patent Laws Influence Innovation?  Evidence from Nineteenth-Century World Fairs, The American Economic Review, Volume 95, Number 4, September 2005, pp. 1214-1236* |
| Data on patent pools in 20 industries under the New Deal | `pools111203b.xlsx`, sheet = `pool_chars.csv` | *Patent Pools, Competition and Innovation*, *JLEO*, 2016. |
| US sewing machine industry patent pools | `RJE_data140123.dta` | *Patent Pools and Innovation in Substitute Technologies*, *RAND Journal*, 2014. |
| Sewing machine patent pools – main data | `JEH_data140123.dta` | *Do Patent Pools Encourage Innovation?*, *JEH*, 2010. |
| Patents issued per chemical field to U.S. inventors with indicator identifying if subclass was confiscated under the Trading with the Enemy Act (TWEA). | `twea_data.dta` | *Compulsory Licensing: Evidence from the Trading with the Enemy Act*, with Alessandra Voena. The American Economic Review. Volume 102, Issue 1, February 2012, pp. 396–427. |
| Patents issued in Germany to U.S. inventors between January 1, 1900, and December 31, 1930. The dataset includes field-level indicators for whether the corresponding technology had at least one German-owned U.S. patent licensed to a U.S. firm under the Trading with the Enemy Act (TWEA). | `class_year.dta` | *Compulsory Licensing and Innovation - Evidence from German Patents after World War I*, with Joerg Baten and Nicola Bianchi.  Journal of Development Economics, Volume 126, May 2017. |
| Italian opera-level data including state of premier, year, and composer. Additional indicators include longevity of opera and if included in Amazon or performed at the Metropolitan Opera. | `20years.dta` | *Copyright and Creativity. Evidence from Italian Operas*, with Michela Giorcelli. Appendix. Journal of Political Economy, Volume 128, Number 11, November 2020, pp. 4163-4210. |
| Composer-level data for Italian composers living abroad with the year of return to Italy. | `Fig 5.xlsx` | *Copyright and Creativity. Evidence from Italian Operas*, with Michela Giorcelli. Appendix. Journal of Political Economy, Volume 128, Number 11, November 2020, pp. 4163-4210. |
| Italian opera performances including longevity of opera and number of performances after premier. | `repeated_performances140405.dta` |  *Copyright and Creativity. Evidence from Italian Operas*, with Michela Giorcelli. Appendix. Journal of Political Economy, Volume 128, Number 11, November 2020, pp. 4163-4210. |
| Price data on publication books with indicators of author, volume, and publication year. | `dat_rom_ecb_final.dta` | *Dead Poet’s Property – How Does Copyright Influence Price?*, with Xing Li and Megan MacGarvie. RAND Journal of Economics 49 (1): 2018, pp. 181-205.|
| Citation data for scientific books with year of citation and indication if book was part of the Book Republication Program (BRP). | `books_data.dta`; `brp_dataset.dta` | *Effects of Copyright on Science - Evidence from the WWII Book Republication Program*, with Barbara Biasi. Forthcoming in the AEJ Microeconomics. Vol. 13, No. 4, November 2021. pp. 218-60. |
| Citations by Men of Science  (MoS) and PhD students in mathematics for BRP books. | `mos_citations.dta` | *Effects of Copyright on Science - Evidence from the WWII Book Republication Program*, with Barbara Biasi. Forthcoming in the AEJ Microeconomics. Vol. 13, No. 4, November 2021. pp. 218-60. |
| Library information with citations attributed to BRP books. Includes coordinates. | `libraries_books.dta`; `libraries_cit_coord.dta` | *Effects of Copyright on Science - Evidence from the WWII Book Republication Program*, with Barbara Biasi. Forthcoming in the AEJ Microeconomics. Vol. 13, No. 4, November 2021. pp. 218-60. |
---

## Data Files for Replication Code
| **Code Description** | **Code File** | **Data File(s) Used** |
|----------------------|---------------|-----------------------|
|Replication of Figure 1.4 | `Figure_1.4.R` | `Brit_patents_app_sealed1617-1938.xlsx`|
|Replication of Figure 3.1 |  `Figure_3.1.R` | `rpat100513.xls`|
|Replication of Figure 3.6 |  `Figure_3.6.R` | `rpat100513.xls`|
|Replication of Figure 3.7 |  `Figure_3.7.R` | `pat_prize_sciam_cit.dta`|
|Replication of Figure 5.1 |  `Figure_5.1.R` | `usa1851_JO90724.xls`; `Britain1851.xls`; `industry.dta`|
|Replication of Figure 5.2 |  `Figure_5.2.R` | `rpat100513.xls`|
|Replication of Figure 5.4 |  `Figure_5.4.R` | `rpat509rep.xls`|
|Replication of Figure 6.1 |  `Figure_6.1.R` | `sewing_machines906022.xls`, sheet = `Tab sm pat total pat`|
|Replication of Figure 6.2 |  `Figure_6.2.R` | `RJE_data140123.dta`|
|Replication of Figure 9.4 |  `Figure_9.4.R` | `twea_data.dta`|
|Replication of Figure 9.5 |  `Figure_9.5.R` | `twea_data.dta`|
|Replication of Figure 9.7 |  `Figure_9.7.R` | `twea_data.dta`|
|Replication of Figure 9.9 |  `Figure_9.7.R` | `class_year.dta`|
|Replication of Figure 11.2 |  `Figure_11.2.R` | `20years.dta`|
|Replication of Figure 11.3 |  `Figure_11.3.R` | `Fig 5.xlsx`|
|Replication of Figure 11.4 |  `Figure_11.4.R` | `repeated_performances140405.dta`|
|Replication of Figure 11.5 |  `Figure_11.5.R` | `dat_rom_ecb_final.dta`|
|Replication of Figure 11.7 |  `Figure_11.7.R` | `books_data.dta`|
|Replication of Figure 11.8 |  `Figure_11.8.R` | `books_data.dta`|
|Replication of Figure 11.9 |  `Figure_11.9.R` | `brp_dataset.dta`; `mos_citations.dta`|
|Replication of Figure 11.10 |  `Figure_11.10.R` | `libraries_books.dta`|
|Replication of Figure 11.11 |  `Figure_11.11.R` | `libraries_cit_coord.dta`|
|Replication of Table 4.1 |  `Table_4.1.R` | `Britain1851.xls`; `usa1851_census.xls`|
|Replication of Table 6.1 |  `Table_6.1.R` | `pools111203b.xlsx`, sheet = `pool_chars.csv`|
|Replication of Table 9.2 |  `Table_9.2.R` | `class_year.dta`|
---

## Sources for Exhibition Data
Data for Moser (2003, 2005) were originally collected from two official catalogues and one commission report available at the UC Berkeley Library (1997–2002). For this book, the dataset has been extended with revised editions accessible through Google Books, including the Third and Revised Edition of the Official Catalog of the International Exhibition of 1876, the Swiss Catalogue of the International Exhibition 1876 Philadelphia, and the Special Catalogue of the Netherland Section.

- 1851 Exhibits: Royal Commission. Official Catalogue of the Great Exhibition of the Work of Industry of All Nations 1851, Third Corrected and Improved Edition. London: Spicer Brothers, 1851.
- 1876 Exhibits: United States Centennial Commission. International Exhibition 1876 Official Catalogue, Second and Revised Edition. Philadelphia: John R. Nagle and Company, 1876.
- 1851 Awards: Berichterstattungs-Kommission der Deutschen Zollvereins-Regierungen. Amtlicher Bericht über die Industrie-Austellung aller Völker zu London im Jahre 1851. Vols. I–III. Berlin: Verlag der Deckerschen Geheimen Ober-Hofbuchdruckerei, 1852–1853.

## Population Data Construction
Population data are taken from *Annuaire international de statistique* (1916, vol. 1, État de la population (Europe)) for German states (Bavaria, Prussia, Saxony, Württemberg) and from Maddison (2006) for all other countries. Exhibits per capita differ from Moser (2003, 2005) because we use Maddison’s revised population estimates. In particular, Britain’s 1851 population is revised from 25,601,000 (older series) to 26,945,000 (Maddison 2006), a difference of +1,344,000 (+5.25%), and Austria’s from 3,950,000 to 3,978,000, a difference of +28,000 (+0.71%). These revisions mechanically change per-capita exhibit counts even when exhibit totals are unchanged.

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
-------
 
## Notes

- Some data files appear in multiple studies; cite all relevant publications.
- File names are retained as originally released.
- Publications include coauthors where applicable.

---
