
#ここから〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
library(tidyverse)
dir.create("output")
dir.create("demodata/done", recursive = TRUE)

file_list <- list.files("demodata", pattern = "\\.xlsx$") 

datfinal <- map_df(file_list, ~{
  tgtfile <- .
  print( str_c("Processing:", tgtfile) )
  tgtfile_path <- file.path("demodata",tgtfile)
  dat <- readxl::read_excel( tgtfile_path )
  file.copy(from = tgtfile_path,
            to   = file.path("demodata/done", tgtfile) )
  file.remove(tgtfile_path)
  
  return(dat)
}) 
# 
# for( tgtfile in file_list ){
#   print( str_c("Processing:", tgtfile) )
#   tgtfile_path <- file.path("demodata",tgtfile)
#   dat <- readxl::read_excel( tgtfile_path )
#   file.copy(from = tgtfile_path, 
#             to   = file.path("demodata/done", tgtfile) )
#   file.remove(tgtfile_path)
#   datfinal <- bind_rows(datfinal, dat)
# }
write_rds(datfinal, "output/datfinal.rds", compress = "gz")
#〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇