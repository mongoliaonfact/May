# author: bbaasan
# Date:
# version:
# Purpose:create main table that contains time sequance between a given period

# following function create a table which contains sequence of dates between
# period with a given intervals

#interval_between_dates <-


test <- function(start_date, end_date, intervals){
        start = as.POSIXct(start_date, tz = "EST", 
                           format = "%Y-%m-%d %H:%M:%S")
        end = as.POSIXct(end_date, tz = "EST", 
                         format = "%Y-%m-%d %H:%M:%S") 
        time_index = seq.POSIXt(start, end, by = intervals)
        tble = as.data.frame(time_index)
        return(tble)
}

test("2020-03-01 00:00:00", "2022-03-02 00:02:01", "quarters")
