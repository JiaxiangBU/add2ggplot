
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
#> Registered S3 methods overwritten by 'ggplot2':
#>   method         from 
#>   [.quosures     rlang
#>   c.quosures     rlang
#>   print.quosures rlang
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

``` r
library(ggrepel)
#> Warning: package 'ggrepel' was built under R version 3.6.1
#> Loading required package: ggplot2
df <- 
mtcars %>%
    tibble::rownames_to_column()
```

``` r
df %>%
    ggplot() +
    aes(mpg, disp, label = rowname) +
    geom_point(color = 'white') +
    # geom_label_repel use fill arg in the segments.
    geom_label_repel(
        data = function(x)
            df %>% head,
        arrow = arrow(length = unit(0.02, "npc")),
        box.padding = 1,
        segment.color = white_one,
        color = white_one,
        label.size = NA,
        fill = red_two,
        aes(face = "bold")
    ) +
    # theme_white()
    theme_grey_and_red() +
    labs(
        title = '使用labs覆盖',
        subtitle = '使用labs覆盖',
        x = '使用labs覆盖',
        y = '使用labs覆盖',
        caption = '备注: 使用labs覆盖'
    )
#> Warning: Ignoring unknown aesthetics: face
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />
