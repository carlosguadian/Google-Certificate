# Ejemplo de uso de pipes

# Utilizamos el dataset ToothGrowth
data("ToothGrowth")
View(ToothGrowth)

# Cargamos tidyverse
library(tidyverse)

# Del paquete dplyr  para filtrar datos
# Aquellos registros en los que dose es igual a 0.5
filtered_tg <- filter(ToothGrowth, dose == 0.5)
view(filtered_tg)

# Ahora vamos a ordenar el resultado de menor a mayor por "len"
arrange(filtered_tg, len)

# Para conseguir un resultado similar vamos a utilizar las mimmas funciones pero
# anidadas
arrange(filter(ToothGrowth, dose == 0.5), len)

# Vamos a ver con un pipe
# Para introducir el pipe operator
# Windows: ctrl + shift + m
# Mac: cmd + shift + m
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  arrange(len)

view(filtered_toothgrowth)

# Ahora vamos a incorporar al pipe (se debería editar el script anterior) para 
# que los resultados se agrupen por supp y calcule la media
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), .group = "drop")