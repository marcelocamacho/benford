
# benford

<!-- badges: start -->
<!-- badges: end -->

The goal of benford is to implement in GNU R Benford's Law or Law of Anomalous Numbers

## Installation

You can install the development version of benford from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("marcelocamacho/benford")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(benford)
x <- sample(1:10000,1000)

res <- benford(x)

plot.benford(res)
```

Fonte: Palestra apresentada no [YouTube](https://youtu.be/AUjFGd1O8Y0)
Créditos: Julio Trecenti
