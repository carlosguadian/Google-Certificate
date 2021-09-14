## DATA IMPORT BASICS
#
# THE data() FUNCTION
# 
# Para ver los datasets precargados en R
data()

# Para cargar un dataset específico introducirlo en data()
data("mtcars")
mtcars

# THE READR PACKAGE
# 
# Funciones para leer datos
# read_csv(): comma-separated values (.csv) files
# read_tsv(): tab-separated values files
# read_delim(): general delimited files
# read_fwf(): fixed-width files
# read_table(): tabular files where columns are separated by white-space
# read_log(): web log files
# 
# El paquete también viene con varios archivos de ejemplo, para ver cuales hay
readr_example()

# para abrir uno de ellos
read_csv(readr_example("mtcars.csv"))

# THE READXL PACKAGE
# 
# Para abrir xls 
library(readxl)

# También tiene archivos de ejemplo
readxl_example()

# Y para abrir un excel
read_excel(readxl_example("type-me.xlsx"))

# Se puede utilizar excel_sheets() para listar las hojas de un excel
excel_sheets(readxl_example("type-me.xlsx"))

# Por lo tanto, se puede abrir una específica
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")

