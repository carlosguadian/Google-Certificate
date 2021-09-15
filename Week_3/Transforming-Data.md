Transforming Data
================
Carlos Guadián
9/14/2021

## Cargar Tidyr

``` r
library(tidyr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

## Crear un data frame

Vamos a crear tres vectores y fusionarlos en un dataframe para trabjar
con él.

``` r
id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
```

## Separar datos de una columna

Vamos a separar la columna name en first y last name, indicando que lo
debe hacer al primer espacio en blanco. Lo vamos a guardar en
employee\_2 para después.

``` r
employee_2 <- separate(employee, name, into = c("first_name", "last_name"), sep = " ")
```

## Unir datos de una columna

Ahora vamos a la inversa, vamos a unir datos de diferentes columna en
una sola. Uniremos de nuevo first y last name para dejarlo como al
principio.

``` r
unite(employee_2, "name", first_name, last_name, sep = " ")
```

    ##    id              name    job_title
    ## 1   1       John Mendes Professional
    ## 2   2       Rob Stewart   Programmer
    ## 3   3 Rachel Abrahamson   Management
    ## 4   4   Christy Hickman     Clerical
    ## 5   5    Johnson Harper    Developer
    ## 6   6    Candace Miller   Programmer
    ## 7   7     Carlson Landy   Management
    ## 8   8      Pansy Jordan     Clerical
    ## 9   9      Darius Berry    Developer
    ## 10 10    Claudia Garcia   Programmer

## Crear una nueva variable

Con mutate() podemos añadir columnas con cálculos de otras variables.
Consultamos la variables en el dataset penguins.

``` r
library(palmerpenguins)
```

Añadimos una nueva columna calculando los Kg de los pingüinos y su
altura en m.

``` r
penguins %>% 
  mutate(body_mass_kg = body_mass_g / 1000, flipper_length_m = flipper_length_mm / 1000)
```

    ## # A tibble: 344 × 10
    ##    species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>   <fct>              <dbl>         <dbl>             <int>       <int>
    ##  1 Adelie  Torgersen           39.1          18.7               181        3750
    ##  2 Adelie  Torgersen           39.5          17.4               186        3800
    ##  3 Adelie  Torgersen           40.3          18                 195        3250
    ##  4 Adelie  Torgersen           NA            NA                  NA          NA
    ##  5 Adelie  Torgersen           36.7          19.3               193        3450
    ##  6 Adelie  Torgersen           39.3          20.6               190        3650
    ##  7 Adelie  Torgersen           38.9          17.8               181        3625
    ##  8 Adelie  Torgersen           39.2          19.6               195        4675
    ##  9 Adelie  Torgersen           34.1          18.1               193        3475
    ## 10 Adelie  Torgersen           42            20.2               190        4250
    ## # … with 334 more rows, and 4 more variables: sex <fct>, year <int>,
    ## #   body_mass_kg <dbl>, flipper_length_m <dbl>
