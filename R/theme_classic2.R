#' Another classic theme
#'
#' # Inspired by
#' https://www.datacamp.com//courses/intermediate-data-visualization-with-ggplot2
#' @importFrom ggplot2 theme element_blank element_text element_line
#' @return ggplot object.
#' @export
#' @examples
#' datasets::mtcars %>%
#'   ggplot2::ggplot(ggplot2::aes(mpg, disp)) +
#'   ggplot2::geom_point() +
#'   theme_classic2()
theme_classic2 <- function() {
    ggplot2::theme(
        panel.background = ggplot2::element_blank(),
        legend.background = ggplot2::element_blank(),
        legend.key = ggplot2::element_blank(),
        # declutter
        strip.background = ggplot2::element_blank(),
        # declutter
        panel.grid = ggplot2::element_blank(),
        axis.text = ggplot2::element_text(colour = "black"),
        axis.line = ggplot2::element_line(colour = "black")
    )
}
# similar to
# theme_classic() +
# theme(strip.background = element_blank())
