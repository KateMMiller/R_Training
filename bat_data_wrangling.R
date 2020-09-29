#-------------------------------
library(tidyverse) # For multiple packages, including %>%, dplyr, purrr
library(readxl) # reading and working with excel files
#-------------------------------
# Read in all worksheets within the capture data spreadsheet
path_cap <- c("data/misc_files/ANP_BAT_MasterCaptureDB_1996-2019 20200811.xlsx")

excel_sheets(path_cap) %>% map(function(sheet){
  assign(x = tolower(gsub(" ", "_", sheet)), 
         value = read_xlsx(path = path_cap, sheet = sheet),
         envir = .GlobalEnv)
})

read_xlsx(path = path_cap, sheet = "All Records")

# Read in all worksheets within the trap data spreadsheet
path_trap <- c("data/ANP_BAT_MasterTrapSiteList_2008-2019 20191216.xlsx")

excel_sheets(path_trap) %>% map(function(sheet){
  assign(x = tolower(gsub(" ", "_", sheet)), 
         value = read_xlsx(path = path_trap, sheet = sheet),
         envir = .GlobalEnv)
})

ls() # shows all objects that were added to the global environment from the above code
# Should include all of the worksheets with data from the 2 spreadsheets.

str(all_records)
