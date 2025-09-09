# Description: Replication script for Table 2.1
# Author: Laura Carreno Carrillo

# Set working directory to script folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Clean Environment
rm(list = ls(all = TRUE))
gc()

options(stringsAsFactors = F)
options(scipen=999)

'%nin%' <- negate('%in%')

# load packages
library(tidyverse)
library(readxl)
library(gt) # format table

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 3/'

exhibit.df <- read_excel(paste0(data_path, 'rpat100513.xls'), skip = 1)

# create table on statistics of the World's Fairs
countries_1851 <- c('Belgium', 'France', 'Austria', 'Netherlands', 
                    'Norway & Sweden', 'Bavaria', 'Britain', 'United States',
                    'Saxony', 'Prussia', 'Wuttermberg', 'Switzerland', 'Denmark')

countries_1876 <- c('Belgium', 'United States', 'Portugal', 'Spain', 'Austria',
                    'France', 'Germany', 'Britain', 'Denmark', 'Sweden',
                    'Norway', 'Switzerland', 'Netherlands')
table.df <-
    exhibit.df %>%
    group_by(year, country) %>%
    summarise(patent_length = pleng,
              total_exhibits = round(rowSums(across(starts_with('class')), na.rm = T), 0),
              population = round(pop/1000, 2),
              exhibit_pc = round((total_exhibits/population), 0),
              # GDP per capita = gdpmadpc
              # However, some numbers were missing so I'm re-estimating it
              # by dividing gdpmad (aggregate version) / population
              gdp_pc = round((gdpmad/pop)*1000, 0),
              .groups = 'drop') %>%
    # fix country names
    mutate(country = case_when(country == 'Norswe' ~ 'Norway & Sweden', 
                               country == 'US' ~ 'United States',
                               T ~ country)) %>% 
    # filter countries we want to show
    filter(year == 1851 & country %in% countries_1851 |
               year == 1876 & country %in% countries_1876) %>%
    arrange(year, -patent_length, -gdp_pc) %>%
    
    # Format table to make it publication-ready
    gt(rowname_col = 'country', 
       groupname_col = 'year') %>%
    tab_spanner(label = 'Patent Length and Exhibits Per Capita Across Countries',
        columns = c(patent_length, 
                    total_exhibits, 
                    population, 
                    exhibit_pc, gdp_pc)) %>%
    cols_align(align = 'center',
               columns = c(patent_length, total_exhibits, 
                           population, exhibit_pc, gdp_pc)) %>%
    tab_options(table.margin.left = 10,
                table.margin.right = 10) %>% 
    cols_label(
        patent_length = 'Patent \n Length',
        total_exhibits = 'Total \n Exhibits',
        population = 'Population \n (in million)',
        exhibit_pc = 'Exhibits \n per capita \n (in million)',
        gdp_pc = 'GDP \n per capita (in million)') %>%
    fmt_number(columns = c(gdp_pc),
               decimals = 0, use_seps = TRUE) %>%
    opt_table_font(font = list(google_font(name = "Times New Roman")))

gtsave(table.df, paste0(output_path, 'Table_3.1.png'))
