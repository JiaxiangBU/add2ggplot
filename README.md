
<!-- README.md is generated from README.Rmd. Please edit that file -->

# add2ggplot

The goal of add2ggplot is to add more theme for your ggplot object.

## Installation

You can install the released version of add2ggplot from
[Github](https://github.com/JiaxiangBU/add2ggplot) with:

``` r
devtools::install_github('JiaxiangBU/add2ggplot')
```

``` r
library(add2ggplot)
```

## Examples

``` r
library(add2ggplot)
```

``` r
plot_logo <- add_logo(
  plot_path = "man/figures/logo.png",
  logo_path = "man/figures/jiaxiang.png",
  logo_position = "bottom right",
  logo_scale = 5)
plot_logo
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />
