
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

``` r
z <-
    ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
    geom_jitter(alpha = 0.7) +
    scale_color_brewer(
        "Species",
        palette = "Dark2",
        labels = c("Setosa",
                   "Versicolor",
                   "Virginica")
    ) +
    scale_y_continuous("Width (cm)",
                       limits = c(2, 4.5),
                       expand = c(0, 0)) +
    scale_x_continuous("Length (cm)", limits = c(4, 8), expand = c(0, 0)) +
    ggtitle("Sepals") +
    coord_fixed(1)
```

``` r
z
#> Warning: Removed 1 rows containing missing values (geom_point).
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />

``` r
z + theme_classic()
```

<img src="man/figures/README-unnamed-chunk-8-2.png" width="100%" />

``` r
z + theme_classic2()
```

<img src="man/figures/README-unnamed-chunk-8-3.png" width="100%" />

<h4 align="center">

**Code of Conduct**

</h4>

<h6 align="center">

Please note that the `add2ggplot` project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md).<br>By
contributing to this project, you agree to abide by its terms.

</h6>

<h4 align="center">

**License**

</h4>

<h6 align="center">

MIT © [Jiaxiang Li](LICENSE.md)

</h6>
