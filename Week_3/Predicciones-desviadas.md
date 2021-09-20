Predicciones Desviadas
================
Carlos Guadián
9/15/2021

## Predicciones no tan acertadas

Cuando se analizan datos se puede inferir el comportamiento o los
resultados, pero no siempre son tan acertados como desearíamos.

Con la función Bias podemos calcular cual ha sido la desviación respecto
de lo esperado.

Vamos a hacer una prueba con temperaturas y el paquete SimDesign.

``` r
install.packages("SimDesign")
```

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/c6/hvwngrfn7bd1d8fflmlgn5380000gn/T//RtmppbTBwn/downloaded_packages

``` r
library(SimDesign)
```

Primero definimos las temperaturas. Actual y predecida. Y calculamos su
desviación con “bias”.

``` r
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicted_temp)
```

    ## [1] 0.7166667

Como se puede ver, la diferencia no es muy grande, por lo que las
predicciones se ajustan bastante a la realidad.

Ahora vamos a probar con cifras de venta de una tienda de videojuegos.

``` r
actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actual_sales, predicted_sales)
```

    ## [1] -35

En este caso hay una predicción negativa de -35, es un indicador que
debería hacer plantearse el modelo de predicción para ajustar los stocks
de la tienda de una manera más óptima.
