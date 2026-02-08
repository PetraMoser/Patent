# Description: Replication script for Figure 11.10
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
library(openxlsx)
library(ggplot2)
library(maps)

# data paths and data 
data_path <- '../Data/'
output_path <- '../Chapter 11/'

library.df <- haven::read_dta(paste0(data_path, 'libraries_cit_coord.dta'))
US.df <- map_data('state') # state coordinates

# Create Map
US.df %>%
    ggplot() +
    geom_polygon(aes(long, lat, group = group), 
                 fill = 'white', 
                 color='#313647', 
                 size = 0.15) +
    theme_void() +
    geom_point(data = library.df,
               aes(x = longitude,
                   y = latitude,
                   color = as.factor(type),
                   shape = as.factor(type),
                   size = circlesize), 
               alpha = 0.8) +
    scale_color_manual(values = c('#060771', '#850E35')) +
    scale_shape_manual(values = c(20, 21)) +
    scale_size_area(max_size = 20) +
    coord_fixed(1.3) +
    theme_void() +
    theme(legend.position = 'none')

ggsave(paste0(output_path, 'Figure_11.10.png'), width = 10, height = 6)
