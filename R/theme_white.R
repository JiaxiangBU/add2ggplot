#' A ggplot theme with a white background.
#' @export
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
