## TIDY DATA STANDARDS
# Variables are organized into columns
# Observations are organized into rows
# Each value must have its own cell

## WORKING WITH DATAFRAMES
# Cargamos librerías
library(tidyverse)
library(ggplot2)

# Conectamos y visualizamos dataset diamonds
data("diamonds")
view(diamonds)
head(diamonds)

# Podemos consultar la estructura del dataset con str(), glimpse() y colnames()
str(diamonds)
colnames(diamonds)
glimpse(diamonds)

# Si queremos hacer cambios en el dataframe podemos utilizar mutate() por ejemplo
# para añadir una columna que sea el resultado de * 100 carat (previsualiza un tibble)
mutate(diamonds, carat_2 = carat * 100) 

## CREATING TIBBLES
# el paquete tibble es parte de tidyverse
# Se puede convertir un dataframe en tibble
as_tibble(diamonds)

# Se puede utilizar con dataframes, listas, matrices o tablas.
# También se puede crear con vectores de columna con tibble()
tibble(x = 1:5, y = 1, z = x ^ 2 +y)

# tibble() hace mucho menos que data.frame(): nunca cambia el tipo de las 
# entradas (por ejemplo, ¡nunca convierte cadenas en factores!), nunca cambia 
# los nombres de las variables, sólo recicla las entradas de longitud 1, y nunca 
# crea row.names()

# Se puede crear un tibble fila a fila
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)