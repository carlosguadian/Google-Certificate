Cleaning Data
================

``` r
options(repos = list(CRAN="http://cran.rstudio.com/"))
```

# BASICS

Primero instalación y carga de los paquetes que vamos a utilizar. Si ya
están instalados procedemos al segundo paso.

``` r
install.packages("here")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpJXAV9U/downloaded_packages

``` r
install.packages("skimr")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpJXAV9U/downloaded_packages

``` r
install.packages("janitor")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpJXAV9U/downloaded_packages

``` r
install.packages("dplyr")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpJXAV9U/downloaded_packages

Procedemos a cargarlos

``` r
library("here")
```

    ## here() starts at /Users/carlosguadian/Google-Certificate

``` r
library("skimr")
library("janitor")
```

    ## 
    ## Attaching package: 'janitor'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

``` r
library("dplyr")
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Utilizaremos como ejemplo Penguin Palmer Package. Instalamos y cargamos

``` r
install.packages("palmerpenguins")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpJXAV9U/downloaded_packages

``` r
library("palmerpenguins")
```

Vamos a pedir un resumen (sumario) del dataset

``` r
skim_without_charts(penguins)
```

|                                                  |          |
|:-------------------------------------------------|:---------|
| Name                                             | penguins |
| Number of rows                                   | 344      |
| Number of columns                                | 8        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| factor                                           | 3        |
| numeric                                          | 5        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: factor**

| skim\_variable | n\_missing | complete\_rate | ordered | n\_unique | top\_counts                 |
|:---------------|-----------:|---------------:|:--------|----------:|:----------------------------|
| species        |          0 |           1.00 | FALSE   |         3 | Ade: 152, Gen: 124, Chi: 68 |
| island         |          0 |           1.00 | FALSE   |         3 | Bis: 168, Dre: 124, Tor: 52 |
| sex            |         11 |           0.97 | FALSE   |         2 | mal: 168, fem: 165          |

**Variable type: numeric**

| skim\_variable      | n\_missing | complete\_rate |    mean |     sd |     p0 |     p25 |     p50 |    p75 |   p100 |
|:--------------------|-----------:|---------------:|--------:|-------:|-------:|--------:|--------:|-------:|-------:|
| bill\_length\_mm    |          2 |           0.99 |   43.92 |   5.46 |   32.1 |   39.23 |   44.45 |   48.5 |   59.6 |
| bill\_depth\_mm     |          2 |           0.99 |   17.15 |   1.97 |   13.1 |   15.60 |   17.30 |   18.7 |   21.5 |
| flipper\_length\_mm |          2 |           0.99 |  200.92 |  14.06 |  172.0 |  190.00 |  197.00 |  213.0 |  231.0 |
| body\_mass\_g       |          2 |           0.99 | 4201.75 | 801.95 | 2700.0 | 3550.00 | 4050.00 | 4750.0 | 6300.0 |
| year                |          0 |           1.00 | 2008.03 |   0.82 | 2007.0 | 2007.00 | 2008.00 | 2009.0 | 2009.0 |

Si queremos tener una idea rápida de lo que hay en el dataset usamos
glimpse()

``` r
glimpse(penguins)
```

    ## Rows: 344
    ## Columns: 8
    ## $ species           <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, Adel…
    ## $ island            <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torgerse…
    ## $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34.1, …
    ## $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18.1, …
    ## $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, 186…
    ## $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 3475, …
    ## $ sex               <fct> male, female, female, NA, female, male, female, male…
    ## $ year              <int> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007…

Con head() también tenemos una rápida preview de los datos

``` r
head(penguins)
```

    ## # A tibble: 6 × 8
    ##   species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g sex  
    ##   <fct>   <fct>           <dbl>         <dbl>            <int>       <int> <fct>
    ## 1 Adelie  Torge…           39.1          18.7              181        3750 male 
    ## 2 Adelie  Torge…           39.5          17.4              186        3800 fema…
    ## 3 Adelie  Torge…           40.3          18                195        3250 fema…
    ## 4 Adelie  Torge…           NA            NA                 NA          NA <NA> 
    ## 5 Adelie  Torge…           36.7          19.3              193        3450 fema…
    ## 6 Adelie  Torge…           39.3          20.6              190        3650 male 
    ## # … with 1 more variable: year <int>

Ahora ya podemos seleccionar los datos con los que queremos trabajar.
Por ejemplo, si queremos ver species

``` r
penguins %>%
  select(species)
```

    ## # A tibble: 344 × 1
    ##    species
    ##    <fct>  
    ##  1 Adelie 
    ##  2 Adelie 
    ##  3 Adelie 
    ##  4 Adelie 
    ##  5 Adelie 
    ##  6 Adelie 
    ##  7 Adelie 
    ##  8 Adelie 
    ##  9 Adelie 
    ## 10 Adelie 
    ## # … with 334 more rows

O si por ejemplo lo queremos todo excepto species

``` r
penguins %>%
  select(-species)
```

    ## # A tibble: 344 × 7
    ##    island  bill_length_mm bill_depth_mm flipper_length_… body_mass_g sex    year
    ##    <fct>            <dbl>         <dbl>            <int>       <int> <fct> <int>
    ##  1 Torger…           39.1          18.7              181        3750 male   2007
    ##  2 Torger…           39.5          17.4              186        3800 fema…  2007
    ##  3 Torger…           40.3          18                195        3250 fema…  2007
    ##  4 Torger…           NA            NA                 NA          NA <NA>   2007
    ##  5 Torger…           36.7          19.3              193        3450 fema…  2007
    ##  6 Torger…           39.3          20.6              190        3650 male   2007
    ##  7 Torger…           38.9          17.8              181        3625 fema…  2007
    ##  8 Torger…           39.2          19.6              195        4675 male   2007
    ##  9 Torger…           34.1          18.1              193        3475 <NA>   2007
    ## 10 Torger…           42            20.2              190        4250 <NA>   2007
    ## # … with 334 more rows

Otra acción que podemos hacer para facilitar el análisis si fuera
necesario es renombrar una variable (columna)

``` r
penguins %>%
  rename(island_new = island)
```

    ## # A tibble: 344 × 8
    ##    species island_new bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <fct>   <fct>               <dbl>         <dbl>             <int>       <int>
    ##  1 Adelie  Torgersen            39.1          18.7               181        3750
    ##  2 Adelie  Torgersen            39.5          17.4               186        3800
    ##  3 Adelie  Torgersen            40.3          18                 195        3250
    ##  4 Adelie  Torgersen            NA            NA                  NA          NA
    ##  5 Adelie  Torgersen            36.7          19.3               193        3450
    ##  6 Adelie  Torgersen            39.3          20.6               190        3650
    ##  7 Adelie  Torgersen            38.9          17.8               181        3625
    ##  8 Adelie  Torgersen            39.2          19.6               195        4675
    ##  9 Adelie  Torgersen            34.1          18.1               193        3475
    ## 10 Adelie  Torgersen            42            20.2               190        4250
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>

Dada la necesidad de usar las variables una y otra vez, es interesante
que los nombres sean consistentes. Con rename\_with() podemos hacerlo.
Por ejemplo que todos utilicen el \_ para unir palabras

``` r
rename_with(penguins, toupper)
```

    ## # A tibble: 344 × 8
    ##    SPECIES ISLAND    BILL_LENGTH_MM BILL_DEPTH_MM FLIPPER_LENGTH_MM BODY_MASS_G
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
    ## # … with 334 more rows, and 2 more variables: SEX <fct>, YEAR <int>

O que estén todos los nombres de variables en minúsculas

``` r
rename_with(penguins, tolower)
```

    ## # A tibble: 344 × 8
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
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>

Y para asegurarnos que no contienen caracteres extraños usamos
clean\_names()

``` r
clean_names(penguins)
```

    ## # A tibble: 344 × 8
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
    ## # … with 334 more rows, and 2 more variables: sex <fct>, year <int>
