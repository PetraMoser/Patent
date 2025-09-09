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
output_path <- '../Chapter 5/'

US.df <- read_excel(paste0(data_path, 'usa1851_JO90724.xls')) 
britain.df <- read_excel(paste0(data_path, 'Britain1851.xls')) 
industry_labels.df <- read_dta(paste0(data_path, 'industry.dta'))

# ================ Patents by Industry ================
# Obtain totals and shares for city size by industry
patent.df <-
    britain.df %>%
    # join with industry labels
    left_join(.,
              industry_labels.df,
              by = 'industryclass') %>%
    filter(!is.na(ind_lbl)) %>% # filter industries with NA
    mutate(
        # assess which exhibits were patents
        patented = ifelse(!is.na(reference_to_patent), 1, 0)) %>%
    group_by(ind_lbl) %>%
    
    # patented by industry
    summarise(total = n(),
              patented = sum(patented, na.rm = T),
              share_patented = round(patented / total, 3),
              .groups = 'drop') %>%
    
    # patented all
    mutate(total_all = nrow(britain.df),
           pat_total = sum(patented, na.rm = T),
           share_all = round(pat_total/total_all, 3),
           country = 'Britain') %>%
    
    # join with US data
    rbind(., 
          test <- US.df %>%
              # join with industry labels
              left_join(.,
                        industry_labels.df,
                        by = c('Industry' = 'industryclass')) %>%
              filter(!is.na(ind_lbl)) %>% # filter industries with NA
              
              # patented by industry
              group_by(ind_lbl) %>%
              summarise(total = n(),
                        patented = sum(Patented),
                        share_patented = round(patented/ total, 3),
                        .groups = 'drop') %>%
              
              # patented all
              mutate(total_all = nrow(US.df %>% filter(Industry <= 29)), # keep only industries we have
                     pat_total = sum(patented, na.rm = T),
                     share_all = round(pat_total/total_all, 3),
                     country = 'US'))



# ================ Replicate Table ================
table.df <-
    patent.df %>%
    select(-starts_with('pat'), -ends_with('_all')) %>%
    
    # include row with values across industries
    bind_rows(
        patent.df %>%
            distinct(country, total_all, share_all) %>%
            mutate(ind_lbl = 'All industries') %>%
            rename('total' = 'total_all',
                   'share_patented' = 'share_all') %>%
            select(ind_lbl, total, share_patented, country)) %>%
    
    # pivot wider to make country names the columns
    pivot_wider(names_from = country,
                values_from = c('total', 'share_patented')) %>%

    # Format table to make it publication-ready
    gt(groupname_col = '1') %>%
    tab_spanner(label = 'Britain',
                columns = c(total_Britain,
                            share_patented_Britain)) %>%
    tab_spanner(label = 'United States',
                columns = c(total_US,
                            share_patented_US,)) %>%
    
    # column labels
    cols_label(ind_lbl = 'Industry',
               total_Britain = 'Total',
               share_patented_Britain = '% Pat',
               total_US = 'Total',
               share_patented_US = '% Pat') %>% 
    
    # add title 
    tab_header(title = md('**Table 5.1 – Differences in inventors\' Reliance on Patents Across Industries**')) %>%
    
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


gtsave(table.df, paste0(output_path, 'Table_5.1.png'))
