# Description: Replication script for Table 9.2
# Author: Laura Carreno Carrillo

# Set working directory to script folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Clean Environment
rm(list = ls(all = TRUE))
gc()

options(stringsAsFactors = F)
options(scipen=999)

'%nin%' <- Negate('%in%')

# load packages
library(tidyverse)
library(haven)
library(ggplot2)

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 9/'

twea.df <- read_dta(paste0(data_path, 'class_year.dta'))

# Create final table and format
desc_stats.df <-
    desc_stats %>%
    
    # create licensed class variable
    mutate(licensed_class = ifelse(nclic == 0, 0, 1)) %>%
    
    #find means
    group_by(licensed_class, )
    
    # number of patents across subclasses with licenses
    group_by(decade, licensed_class) %>%
    summarise(n_patents = sum(count), 
              .groups = 'drop') %>%
    
    # pivot wider for formatting
    pivot_wider(names_from = licensed_class, values_from = n_patents) %>%
    rename('wo_licensed' = `0`, 
           'w_licensed' = `1`) %>%
    
    # Formar table =====
    gt(groupname_col = '1') %>%
    
    # column labels
    cols_label(decade = 'Decade',
               wo_licensed = 'Without Licensed',
               w_licensed = 'With Licensed') %>% 
    
    # add title 
    #tab_header(title = md('**Table 9.2 – Number of U.S. Patents Across USPTO Subclasses**')) %>%
    
    # align columns
    cols_align(align = 'center') %>%
    
    tab_options(table.border.top.style = 'solid',
                table.border.bottom.style = 'solid',
                column_labels.border.bottom.style = 'solid',
                table_body.hlines.style = 'none',
                table_body.vlines.style = 'none') %>%
        
    # format numbers
    fmt_number(columns = !decade,
               decimals = 0,
               sep_mark = ',') %>%
    
    # change font
    opt_table_font(font = list(google_font(name = 'Times New Roman')))


gtsave(desc_stats.df, paste0(output_path, 'Table_9.2.png'))


