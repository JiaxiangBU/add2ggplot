#' Paste Kindle Notes in an elegant way
#'
#' @return function
#' @author Jiaxiang Li
#'
#' @import ggplot2
#' @export

theme_du_bois <- function(font_name = '') {
    ggplot2::theme_gray(base_family = font_name) %+replace%
        ggplot2::theme(
            plot.background = ggplot2::element_rect(
                fill = "antiquewhite2",
                # antiquewhite: antique white
                # 有一种古老画布的感觉
                color = "antiquewhite2"
            ),
            # ggplot2::element_rect: borders and backgrounds.
            # 定义边界和背景图
            # color: Line/border colour.
            # fill : Fill colour.
            panel.background = ggplot2::element_rect(
                fill = "antiquewhite2",
                color = "antiquewhite2"
            ),
            plot.title = ggplot2::element_text(
                hjust = 0.5,
                # hjust
                # Horizontal justification (in [0, 1])
                # 因此 0.5 是居中
                face = "bold"
                # face
                # Font face ("plain", "italic", "bold", "bold.italic")
            ),
            plot.subtitle = ggplot2::element_text(hjust = 0.5)
        )
}
