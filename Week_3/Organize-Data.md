Organize your data
================

Para realizar los ejemplos lo haremos con penguins dataset, parte de
tidyverse

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.4     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   2.0.1     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library("palmerpenguins")
```

## Sorting data

Vamos a ordenar el dataset penguins por bill\_length\_mm con arrange.
Por defecto lo hace en orden ascendente.

``` r
penguins %>% arrange(bill_length_mm)
```

    ## # A tibble: 344 × 8
    ##    species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>   <fct>              <dbl>         <dbl>             <int>       <int>
    ##  1 Adelie  Dream               32.1          15.5               188        3050
    ##  2 Adelie  Dream               33.1          16.1               178        2900
    ##  3 Adelie  Torgersen           33.5          19                 190        3600
    ##  4 Adelie  Dream               34            17.1               185        3400
    ##  5 Adelie  Torgersen           34.1          18.1               193        3475
    ##  6 Adelie  Torgersen           34.4          18.4               184        3325
    ##  7 Adelie  Biscoe              34.5          18.1               187        2900
    ##  8 Adelie  Torgersen           34.6          21.1               198        4400
    ##  9 Adelie  Torgersen           34.6          17.2               189        3200
    ## 10 Adelie  Biscoe              35            17.9               190        3450
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>

Si lo queremos en orden descendente sólo enemos que añadir un - a la
variable.

``` r
penguins %>% arrange(-bill_length_mm)
```

    ## # A tibble: 344 × 8
    ##    species   island bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>     <fct>           <dbl>         <dbl>             <int>       <int>
    ##  1 Gentoo    Biscoe           59.6          17                 230        6050
    ##  2 Chinstrap Dream            58            17.8               181        3700
    ##  3 Gentoo    Biscoe           55.9          17                 228        5600
    ##  4 Chinstrap Dream            55.8          19.8               207        4000
    ##  5 Gentoo    Biscoe           55.1          16                 230        5850
    ##  6 Gentoo    Biscoe           54.3          15.7               231        5650
    ##  7 Chinstrap Dream            54.2          20.8               201        4300
    ##  8 Chinstrap Dream            53.5          19.9               205        4500
    ##  9 Gentoo    Biscoe           53.4          15.8               219        5500
    ## 10 Chinstrap Dream            52.8          20                 205        4550
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>

Para poder trabajar con estos datos sin dañar los originales podemos
asignar el nuevo orden a un nuevo dataframe

``` r
penguins2 <- penguins %>% arrange(-bill_length_mm)
```

## Grouping

Podemos utilizar group\_by() para realizar todo tipo de operaciones,
desde obtener un sumario de los datos a ordenarlos.

Vamos a pedir la media de bill\_length\_mm agrupado por island sin
valores NA

``` r
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_lenght_mm =
                                                            mean(bill_length_mm))
```

    ## # A tibble: 3 × 2
    ##   island    mean_bill_lenght_mm
    ##   <fct>                   <dbl>
    ## 1 Biscoe                   45.2
    ## 2 Dream                    44.2
    ## 3 Torgersen                39.0

Podemos combinar group\_by con más de una variable, igual que summarize

``` r
penguins %>% group_by(species, island) %>% 
  drop_na() %>% summarize(mean_bl = mean(bill_length_mm), max_bl = max(bill_length_mm))
```

    ## `summarise()` has grouped output by 'species'. You can override using the `.groups` argument.

    ## # A tibble: 5 × 4
    ## # Groups:   species [3]
    ##   species   island    mean_bl max_bl
    ##   <fct>     <fct>       <dbl>  <dbl>
    ## 1 Adelie    Biscoe       39.0   45.6
    ## 2 Adelie    Dream        38.5   44.1
    ## 3 Adelie    Torgersen    39.0   46  
    ## 4 Chinstrap Dream        48.8   58  
    ## 5 Gentoo    Biscoe       47.6   59.6

## Filter

Evidentemente podemos filtrar el dataset, por ejemplo por una de las
especies

``` r
penguins %>% filter(species == "Adelie")
```

    ## # A tibble: 152 × 8
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
    ## # … with 142 more rows, and 2 more variables: sex <fct>, year <int>
