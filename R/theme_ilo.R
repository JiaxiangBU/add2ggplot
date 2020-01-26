#' One ggplot theme
#' @return The function to use \code{+} in the ggplot workflow.
#' @export
#' @examples
#' datasets::mtcars %>%
#'   ggplot2::ggplot(ggplot2::aes(mpg, disp)) +
#'   ggplot2::geom_point() +
#'   theme_ilo()
theme_ilo <- function(){
    ggplot2::theme_minimal() +
        ggplot2::theme(
            # text = element_text(family = "Bookman", color = "gray25"),
            plot.subtitle = ggplot2::element_text(size = 9),
            plot.caption = ggplot2::element_text(color = "gray30"),
            # plot.background = element_rect(fill = "gray95"),
            plot.margin = ggplot2::unit(c(5, 10, 5, 10), units = "mm"),
            axis.title.x = ggplot2::element_text(size=12,face = "bold"),
            axis.title.y = ggplot2::element_text(size=12,face = "bold"),
            # x和y的命名，要加粗，ppt才好看
            axis.text.x = ggplot2::element_text(size=7, angle = 70, hjust = 1),
            # 控制axis字体大小，7号大小最好
            axis.text.y = ggplot2::element_text(size=7),
            legend.title=ggplot2::element_blank()
        )
}
