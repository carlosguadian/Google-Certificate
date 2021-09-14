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
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpVEFxRX/downloaded_packages

``` r
install.packages("skimr")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpVEFxRX/downloaded_packages

``` r
install.packages("janitor")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpVEFxRX/downloaded_packages

``` r
install.packages("dplyr")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpVEFxRX/downloaded_packages

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
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmpVEFxRX/downloaded_packages

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
