#' A ggplot theme with a white background.
#' @export
theme_white <- function(){

    theme(
        plot.background = element_rect(
            fill = "white",
            color = "white"
        ),
        panel.background = element_rect(
            fill = "white",
            color = "white"
        ),
    )
}
