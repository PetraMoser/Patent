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
library(haven)
library(gt) # format table

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 4/'

industry_labels.df <- read_dta(paste0(data_path, 'industry.dta'))
britain.df <- read_excel(paste0(data_path, 'Britain1851.xls')) 

# ================ Patents by City Size, Location, and Industry ================
# Obtain totals and shares for city size by industry
brit_ind.df <-
    britain.df %>%
    # join with industry labels
    left_join(.,
              industry_labels.df,
              by = 'industryclass') %>%
    
    mutate(
        # assess which exhibits were patents
        patented = ifelse(!is.na(reference_to_patent), 1, 0),
        
        # assess which cities are large, small, and urban
        city_size = case_when(
            state == 'London' ~ 'London',
            population > 100000 & state != 'London' ~ 'large',
            between(population, 10, 100000) ~ 'small',
            T ~ NA),
        city_loc = case_when(
            population > 10000 | state == 'London' ~ 'urban',
            population <= 10000 | is.na(population) ~ 'rural',
            T ~ NA)) 

size_ind.df <- # panels 1 to 6
    brit_ind.df %>%
    # obtain figures by city and industry
    group_by(ind_lbl, city_size) %>%
    summarise(total = n(),
              patented = sum(patented),
              share_patented = round(patented / total, 3),
              .groups = 'drop')

loc_ind.df <- # panels 7 to 10
    brit_ind.df %>%
    group_by(ind_lbl, city_loc) %>%
    summarise(total = n(),
              patented = sum(patented),
              share_patented = round(patented / total, 3),
              .groups = 'drop')

# ================ Patents by City Size and Location across Industries ================
brit_all.df <-
    britain.df %>%
    # join with industry labels
    left_join(.,
              industry_labels.df,
              by = 'industryclass') %>%
    
    mutate(
        # assess which exhibits were patents
        patented = ifelse(!is.na(reference_to_patent), 1, 0),
        
        # assess which cities are large, small, and urban
        city_size = case_when(
            state == 'London' ~ 'London',
            population > 100000 & state != 'London' ~ 'large',
            between(population, 10, 100000) ~ 'small',
            T ~ NA),
        city_loc = case_when(
            population > 10000 | state == 'London' ~ 'urban',
            population <= 10000 | is.na(population) ~ 'rural',
            T ~ NA)) 

size_ind_all.df <-
    brit_all.df %>%
    # obtain figures by city and industry
    group_by(city_size) %>%
    summarise(ind_lbl = 'All industries',
              total = n(),
              patented = sum(patented),
              share_patented = round(patented / total, 3),
              .groups = 'drop') %>%
    select(ind_lbl, everything())
    
loc_ind_all.df <-
    brit_all.df %>%
    # obtain figures by city and industry
    group_by(city_loc) %>%
    summarise(ind_lbl = 'All industries',
              total = n(),
              patented = sum(patented),
              share_patented = round(patented / total, 3),
              .groups = 'drop') %>%
    select(ind_lbl, everything())

# ================ Replicate Table ================
table.df <-
    # Step 1: row-bind size tables
    bind_rows(size_ind.df, size_ind_all.df) %>%
    filter(!is.na(ind_lbl)) %>%
    select(-patented) %>%
    pivot_wider(names_from = city_size,
                values_from = c('total', 'share_patented')) %>%
    
    # Step 2: merge with table on city location (Urban vs. Rural)
    left_join(., 
              bind_rows(loc_ind.df, loc_ind_all.df) %>%
                  filter(!is.na(city_loc)) %>%
                  select(-patented) %>%
                  pivot_wider(names_from = city_loc,
                              values_from = c('total', 'share_patented')),
              by = 'ind_lbl') %>%
    
    # select them into the right order
    select(ind_lbl, ends_with('London'), ends_with('large'), ends_with('small'), 
           ends_with('urban'), ends_with('rural')) %>%
    mutate_if(is.numeric, ~replace_na(., 0)) %>%

    # Format table to make it publication-ready
    gt(groupname_col = '1') %>%
    tab_spanner(label = 'London',
                columns = c(total_London,
                            share_patented_London)) %>%
    tab_spanner(label = 'Large Cities (>100K)',
                columns = c(total_large,
                            share_patented_large,)) %>%
    tab_spanner(label = 'Small Cities (10-100k)',
                columns = c(total_small,
                            share_patented_small)) %>%
    tab_spanner(label = 'All Urban (>10k)',
                columns = c(total_urban,
                            share_patented_urban)) %>%
    tab_spanner(label = 'Rural (<10k)',
                columns = c(total_rural,
                            share_patented_rural)) %>%
    
    # column labels
    cols_label(ind_lbl = 'Industry',
               total_London = 'Total',
               share_patented_London = '% Pat',
               total_large = 'Total',
               share_patented_large = '% Pat',
               total_small = 'Total',
               share_patented_small = '% Pat',
               total_urban = 'Total',
               share_patented_urban = '% Pat',
               total_rural = 'Total',
               share_patented_rural = '% Pat') %>% 
    
    # add title 
    tab_header(title = md('**Table 4.2 – Patenting Rates in Britain, Cities vs Urban Areas**')) %>%
    
    # align columns
    cols_align(align = 'center',
               columns = -ind_lbl) %>%
    
    tab_options(table.margin.left = 10,
                table.margin.right = 10) %>% 
    
    # Make percentages
    fmt_percent(columns = starts_with('share_'), decimals = 1) %>%
    
    # format thousands
    fmt_number(columns = starts_with('total'), decimals = 0, use_seps = T) %>%
    
    opt_table_font(font = list(google_font(name = "Times New Roman")))


gtsave(table.df, paste0(output_path, 'Table_4.2.png'))
