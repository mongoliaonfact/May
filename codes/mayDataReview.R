# author: bbaasan
# Date: Jun 18, 2022
# version:
# Purpose: May data review


library(tidyverse)
library(lubridate)

list.files('../may_data')

read_csv("../may_data/appearances_2022-05-01.csv", show_col_types = F) %>% 
        #select(bird_view) %>%
        #select(ts) %>%
        #select(device_id) %>% 
        mutate(geo_points = if_else(grepl('^P', bird_view) == TRUE, "T", "F")) %>% 
        mutate(timestamp = as.POSIXct(ts, tz='EST')) %>% 
        mutate(did = str_replace(device_id, '-.*', '')) %>% 
        filter(geo_points != "T") %>% 
        select(timestamp, did, geo_points, bird_view, user_id) %>% 
        print(n=100)
