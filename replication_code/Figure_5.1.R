# Description: Replication script for Figure 3.1
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
library(readxl)
library(ggrepel)

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 5/'

exhibit.df <- read_excel(paste0(data_path, 'rpat100513.xls'), skip = 1)

# ========= Create data frame to replicate figure =======
countries <- c('Britain', 'Switzerland', 'Belgium', 'Saxony', 'Wurttemberg', 'Prussia', 
               'France', 'Austria', 'Netherlands', 'Norway & Sweden', 'Denmark', 'Bavaria')

fig.df <-
    exhibit.df %>%
    mutate(country = case_when(country == 'Norswe' ~ 'Norway & Sweden', T ~ country),
           total_exhibits = rowSums(across(starts_with('class')), na.rm = T)) %>% 
    # filter for 1851 and for the countries we want to observe
    filter(year == 1851, country %in% countries) %>%
    # Find share of Scientific Instruments per countries
    mutate(share = round(class10 / total_exhibits, 2)) %>%
    # keep only variables for Industry Code 10 (Instruments)
    select(country, year, pleng, share)

# ========= Replicate figure =======
fig.df %>%
    ggplot(., aes(x = pleng, y = share, label = country)) +
    geom_point() +
    geom_text_repel() +
    theme_bw() +
    scale_y_continuous(labels = scales::label_percent(),
                       breaks = seq(0, .3, by = .05)) +
    labs(x = 'Patent Length (years',
         y = 'Share of Scientific Instruments (%)')

ggsave(paste0(output_path, "figure_5.1.png"), width = 11, height = 9)