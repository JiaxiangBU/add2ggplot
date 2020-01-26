#' Use the ggplot theme in grey and red
#'
#' @author Jiaxiang Li
#'
#' @import ggplot2
#' @return The function to use \code{+} in the ggplot workflow.
#' @export
#' @examples
#' datasets::mtcars %>%
#'   ggplot2::ggplot(ggplot2::aes(mpg, disp)) +
#'   ggplot2::geom_point() +
#'   theme_grey_and_red()
theme_grey_and_red <- function() {
    ggplot2::theme_gray() %+replace%
        ggplot2::theme(
            plot.background = ggplot2::element_rect(color = grey_one, fill = grey_one),
            panel.background = ggplot2::element_rect(color = grey_one, fill = grey_one),
            axis.text = ggplot2::element_text(color = white_one),
            axis.title = ggplot2::element_text(color = white_one),
            plot.title = ggplot2::element_text(
                hjust = 0.5,
                face = "bold",
                color = white_one
            ),
            plot.subtitle = ggplot2::element_text(hjust = 0.5,
                                                  color = white_one),
            plot.caption = ggplot2::element_text(hjust = 0,
                                                 color = white_one)
        ) +
        ggplot2::theme(panel.grid.minor = ggplot2::element_blank())

}

#' The chosen color in grey
#' @export
grey_one <- grDevices::rgb(85, 94, 107, max = 255)
#' The chosen color in grey
#' @export
grey_two <- grDevices::rgb(191, 191, 191, max = 255)
#' The chosen color in red
#' @export
red_one <- grDevices::rgb(201, 59, 74, max = 255)
#' The chosen color in red
#' @export
red_two <- grDevices::rgb(186, 49, 79, max = 255)
#' The chosen color in white
#' @export
white_one <- grDevices::rgb(255, 255, 255, max = 255)
# get RGB by screenshot shortcut
