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
output_path <- '../Chapter 4/'

us.df <- read_excel(paste0(data_path, 'usa1851_JO90724.xls'))
britain.df <- read_excel(paste0(data_path, 'Britain1851.xls')) 

# Labels
cities_us <- c('New Orlenas', 'Boston', 'Baltimore', 'Cincinnati', 'Philadelphia', 'New York')
cities_brit <- c('London', 'Leeds')

# Create figure DF
fig.df <-
    us.df %>%
    # assess which exhibits are patented
    mutate(is_patented = ifelse(Patents >= 1, 1, 0)) %>%
    group_by(City) %>%
    summarise(share = sum(is_patented)/ n(),
              city_size = mean(Population, na.rm = T),
              .groups = 'drop') %>%
    mutate(labels = ifelse(City %in% cities_us, City, NA),
           country = 'US') %>%
    rbind(., britain.df %>%
              mutate(is_patented = ifelse(reference_to_patent >= 1, 1, 0)) %>%
              group_by(state) %>%
              summarise(share = sum(is_patented, na.rm = T)/ n(),
                        city_size = mean(population, na.rm = T),
                        .groups = 'drop') %>%
              mutate(labels = ifelse(state %in% cities_brit, state, NA),
                     country = 'Britain') %>%
              rename('City' = 'state'))

# Plot
fig.df %>%
    ggplot(., aes(x = city_size, y = share, label = labels)) +
    geom_point() +
    geom_text_repel(max.overlaps = 100) +
    facet_wrap(. ~ country,
               scales = 'free') +
    theme_bw() +
    labs(x = 'City Size',
         y = 'Share of Patented Exhibits') +
    scale_y_continuous(labels = scales::label_percent()) +
    scale_x_continuous(labels = scales::label_comma())

ggsave(paste0(output_path, 'figure_4.1.png'), width = 8, height = 6)

# ===== Statistics check =====
stats.df <-
    us.df %>%
    # assess which exhibits are patented
    mutate(is_patented = ifelse(Patents >= 1, 1, 0),
           city_size = case_when(Population > 100000 ~ 'large', 
                                 between(Population, 10000, 100000) ~ 'small',   
                                 Population < 10000 ~ 'rural'),
           city_loc = ifelse(city_size != 'rural', 'urban', 'rural')) %>%
    filter(City != 'New York') %>% 
    group_by(city_size) %>% 
    summarise(share = sum(is_patented)/ n())
