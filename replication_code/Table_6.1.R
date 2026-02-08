# Description: Replication script for Table 6.1
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
library(openxlsx)
library(gt) # format table

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 6/'

pools.df <- read.xlsx(paste0(data_path, 'pools111203b.xlsx'), sheet = 'pool_chars.csv')

# ================ 20 Patent Pools ================
# Obtain totals and shares for city size by industry
pools_summary.df <-
    pools.df %>%
    group_by(start_year, end_year, pool_id) %>%
    # Create variables of interest ====
    summarise(member_firms = pool_members,
              pool_patents = num_inital_pats,
              .groups = 'drop') %>%
    
    # filter for pools formed after 1930
    filter(between(start_year, 1930, 1938)) %>%
    
    # assign names of industries
    mutate(Industry = case_when(
        pool_id == '1930Cabl' ~ 'High Tension Cables',
        pool_id == '1930Wate' ~ 'Water Conditioning',
        pool_id == '1931Fuel' ~ 'Fuel Injection',
        pool_id == '1932Phar' ~ 'Pharmaceuticals',
        pool_id == '1932Rail' ~ 'Railroad Springs',
        pool_id == '1932Text' ~ 'Textile Machines',
        pool_id == '1933Hydr' ~ 'Hydraulic Oil Pumps',
        pool_id == '1933Mach' ~ 'Machine tools',
        pool_id == '1933Phil' ~ 'Phillips Screws',
        pool_id == '1934Colo' ~ 'Color Cinematography',
        pool_id == '1934Dry' ~ 'Dry Ice',
        pool_id == '1934Elec' ~ 'Electric Generators',
        pool_id == '1934Leci' ~ 'Lecithin',
        pool_id == '1934Vari' ~ 'Variable Condensers',
        pool_id == '1935Airc' ~ 'Aircraft Instruments',
        pool_id == '1937Stam' ~ 'Stamped Metal Wheels',
        pool_id == '1937Wrin' ~ 'Wrinkle Paint Finishes',
        pool_id == '1938Drop' ~ 'Fause Cutouts',
        pool_id == '1938Opht' ~ 'Ophtalmic Frames',
        pool_id == '1938Slip' ~ 'Furniture Slip Covers',
        T ~ NA_character_),
        year_range = paste0(start_year, '-', str_extract(end_year, '[[:digit:]]{2}$'))) %>%
    drop_na() %>%
    
    # select only variables we need
    select(Industry, year_range, member_firms, pool_patents) %>%
    
    # Formar table =====
    gt(groupname_col = '1') %>%
    
    # column labels
    cols_label(Industry = 'Industry',
               year_range = 'Year Formed - Year Dissolved',
               member_firms = 'Member Firms',
               pool_patents = 'Pool Patents') %>% 
    
    # add title 
    tab_header(title = md('**Table 6.1 – Patent Pools Formed Between 1930 and 1938**')) %>%
    
    # align columns
    cols_align(align = 'center',
               columns = -Industry) %>%
    
    tab_options(table.margin.left = 10,
                table.margin.right = 10) %>% 
    
    # change font
    opt_table_font(font = list(google_font(name = "Times New Roman")))


gtsave(pools_summary.df, paste0(output_path, 'Table_6.1.png'))
