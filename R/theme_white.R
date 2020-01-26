#' A ggplot theme with a white background.
#' @return The function to use \code{+} in the ggplot workflow.
#' @export
#' @examples
#' datasets::mtcars %>%
#'   ggplot2::ggplot(ggplot2::aes(mpg, disp)) +
#'   ggplot2::geom_point() +
#'   theme_white()
theme_white <- function(){

    theme(
        plot.background = ggplot2::element_rect(
            fill = "white",
            color = "white"
        ),
        panel.background = ggplot2::element_rect(
            fill = "white",
            color = "white"
        ),
    )
}
