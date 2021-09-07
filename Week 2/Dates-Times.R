#Para hacer la intro de fechas y horas se utilizará tidyverse y lubridate

install.packages("tidyverse") 
library(tidyverse)
library(lubridate)

# En R hay tres tipos de datos que se refieren a un instante en el tiempo:
#   
# Una fecha ("2016-08-16")
# Una hora dentro de un día ("20:11:59 UTC")
# Y una fecha-hora. Se trata de una fecha más una hora ("2018-03-31 18:15:48 UTC")

#Para obtener la fecha actual utilizamos today()
today()

#Para fecha y hora usamos now()
now()

# El formato por defecto en R es yymmdd

# Para convertir a fecha de una cadena de texto utilizamos
# ymd si la estructura de la fecha es año, mes, día
ymd("2021-01-20")
# dmy si la estructura es día, mes, año
dmy("07-09-2021")
# mdy si es mes, día y año
mdy("January 20th, 2021")
#también funciona con números sin comillas
ymd(20210120)
# Si tenemos cadenas con hora y minutos
ymd_hms("2021-01-20 20:11:59")
mdy_hm("01/20/2021 08:01")
# También podemos cambiar entre formatos.
#Por ejemplo, cambiar entre fecha y hora a sólo fecha
as_date(now())

# Más en https://rawgit.com/rstudio/cheatsheets/master/lubridate.pdf