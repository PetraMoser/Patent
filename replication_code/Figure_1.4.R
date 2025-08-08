# Description: Replication script for Figure 1.4
# Author: Laura Carreno Carrillo

# Set working directory to script folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Clean Environment
rm(list = ls(all = TRUE))
gc()

options(stringsAsFactors = F)
options(scipen=999)

# load packages
library(tidyverse)
library(openxlsx)
library(ggrepel)

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 1/Figure_1.4/'


brit_patent.df <- 
    read.xlsx(paste0(data_path, 'Brit_patents_app_sealed1617-1938.xlsx')) %>%
    # transform the number of patents to Log
    mutate(log_app = log(applications),
           log_seal = log(sealed)) %>%
    # transform to long data for easy ploting 
    pivot_longer(cols = c('applications', 
                          'sealed', 
                          'log_app',
                          'log_seal'),
                 names_to = 'patent_type',
                 values_to = 'patents') %>%
    # filter from 1750 to the end of our data set
    # filter for log numbers only
    filter(year >= 1750, grepl('log_', patent_type))

# figure 1.4
brit_patent.df %>%
    ggplot(., aes(x = year, y = patents)) +
    geom_line(aes(linetype = patent_type)) +
    labs(x = 'Year',
         y = 'Log Patents Applications/ Sealed',
         linetype = '') +
    scale_x_continuous(breaks = seq(1750, 1932, by = 20)) +
    scale_y_continuous(breaks = seq(0, 12, by = 2)) +
    theme_classic(base_size = 14) +
    theme(legend.position = c(.9, .1),
          legend.title = element_blank(),
          legend.box.background = element_rect(fill = 'white', color = 'black'),
          legend.key.size = unit(1, "lines"),
          legend.text = element_text(size = 10)) +
    scale_linetype_manual(values = c('longdash', 'solid'),
                          labels = c('Patent Applications', 'Patent Sealed')) +
    geom_vline(xintercept = 1852, linetype = 'dotted') +
    geom_vline(xintercept = 1883, linetype = 'dotted') +
    annotate("text", x = 1855.5, y = 12, label = "1852 Act", angle = -90, hjust = 0, size = 4) +
    annotate("text", x = 1885.5, y = 12, label = "1883 Act", angle = -90, hjust = 0, size = 4) +
    annotate("text", x = 1835, y = 9, label = "1851 World Fair", vjust = 0, size = 4)

ggsave(paste0(output_path, "figure1.4.png"), width = 8, height = 5)
  