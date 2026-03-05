# Replication Code for Pirates and Patents

## By Petra Moser

This folder includes the replication code for all figures and tables in the book.

### Folder Structure:

-   Each script replicates exactly one figure
-   Script name identifies chapter (starting number before a period) and figure number (second number after the period)
-   Each of the script names can be then traced back to the figure numbering inside the book

------------------------------------------------------------------------

### Script Preamble

All scripts have the same initial configuration:

-   Set working directory automatically to where the script lives: `setwd(dirname(rstudioapi::getActiveDocumentContext()$path))`
-   To be able to use `getAciveDocumentContext()` command you need: `install.packages('rstudioapi')`
-   If installation fails, install with devtools:
    1.  `install.packages('devtools')`
    2.  `devtools::install_github("rstudio/rstudioapi")\`
-   Clear environment so memory is restarted and R can process larger datasets
-   Options to remove scientific notation and any numbers of class characters becomes numeric
-   Packages to process data and obtain figures
