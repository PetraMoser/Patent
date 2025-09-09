# Description: Replication script for Figure 5.3
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

patents.df <- read_excel(paste0(data_path, 'sewing_machines906022.xls'), sheet = 'pat by code')

# Replicate figure
fig.df <-
    patents.df %>%
    select(Year,
           `A (Sewing Machines)`,
           `D (Lock-stitch)`) %>%
    # make it long format for easier plotting 
    pivot_longer(cols = c(`A (Sewing Machines)`,
                          `D (Lock-stitch)`),
                 names_to = 'stitch_pat',
                 values_to = 'number') %>%
    mutate(stitch_pat = ifelse(str_detect(stitch_pat, 'A'), 'Chain stitch', 'Lock stitch'),
           number = as.numeric(number),
           year = as.numeric(Year))

# plot
fig.df %>%
    ggplot(., aes(x = year, 
                  y = number,
                  color = stitch_pat,
                  linetype = stitch_pat)) +
    geom_line() +
    theme_bw(base_size = 14) +
    theme(legend.position = 'bottom') +
    labs(x = '', y = '', color = '', linetype = '') +
    scale_color_manual(values = c('#37353E', '#000000')) +
    scale_linetype_manual(values = c('solid', 'longdash')) +
    scale_x_continuous(breaks = seq(1850, 1890, by = 5)) +
    geom_vline(xintercept = 1856, linetype = 'dotted') +
    geom_text(inherit.aes = F,
              x = 1854, y = 60, 
              label = 'Pool forms',
              size = 3) +
    geom_vline(xintercept = 1867, linetype = 'dotted') +
    geom_text(inherit.aes = F,
              x = 1865, y = 60, 
              label = 'Lock stitch patent \nexpires',
              size = 3) +
    geom_vline(xintercept = 1877, linetype = 'dotted') +
    geom_text(inherit.aes = F,
              x = 1875, y = 60, 
              label = 'Last pool patent \nexpires',
              size = 3)

ggsave(paste0(output_path, 'figure_5.4.png'), width = 11, height = 9)        
