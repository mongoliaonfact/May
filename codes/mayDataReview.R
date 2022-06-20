# author: bbaasan
# Date: Jun 18, 2022
# version:
# Purpose: May data review


library(tidyverse)
library(lubridate)

list.files('data')

appear <- read_csv("data/appearances_2022-05-01.csv", 
                            show_col_types = F) %>% 
        mutate(geo_points = if_else(grepl('^P', bird_view) == TRUE, "T", "F")) %>% 
        mutate(timestamp = as.POSIXct(ts, tz='EST')) %>% 
        mutate(did = str_replace(device_id, '-.*', '')) %>% 
        select(timestamp, did, geo_points, bird_view, user_id) 

appear %>% count(geo_points) %>% 
        mutate(percentage = n/sum(n)) %>% 
        rename(count = n) %>% 
        ggplot(aes(x=geo_points, y= percentage, color = geo_points,
                   fill = geo_points))+
        geom_histogram(stat='identity', width=.3)+
        scale_y_continuous(limit = c(0,1), breaks = c(0, .2, .4, .6, .8, 1))+
        theme_classic()+
        theme(legend.position = c(0.8, 0.8),
              legend.title = element_text(color = 'blue', 
                                          size=10, 
                                          face = 'bold'))+
        labs(title = 'Distribution of Geo Points, May 01')+
        ggsave("figures/may_first_geopoint_distr.png")

appear %>% 
        select(timestamp) %>% 
        mutate(day = as.Date(timestamp, tz='EST')) %>% 
        group_by(day) %>% count(day)
