#' Use a palette with 24 colors
#'
#' \code{more_colors} helps users to build a more robust palette serving ggplot objects.
#'
#' @param n the max number of color you choose
#' @return The vector of the colors you choose
#' @author Jiaxiang Li
#'
#' @import RColorBrewer
#' @importFrom utils head
#' @export
#' @examples
#' more_colors(n = 12)
#' more_colors(n = 24)
#' more_colors(n = 36)

more_colors <- function(n = 24){
    c(
        RColorBrewer::brewer.pal(12,'Paired'),
        RColorBrewer::brewer.pal(12,'Set3')
    ) %>%
        head(n)
}
