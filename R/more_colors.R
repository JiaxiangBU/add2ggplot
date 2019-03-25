#' Use a palette with 24 colors
#'
#' \code{more_colors} helps users to build a more robust palette serving ggplot objects.
#'
#' @param n the max number of color you choose
#' @return The vector of the colors you choose
#' @author Jiaxiang Li
#'
#' @import RColorBrewer
#' @export

more_colors <- function(n = 24){
    c(
        RColorBrewer::brewer.pal(12,'Paired'),
        RColorBrewer::brewer.pal(12,'Set3')
    ) %>%
        head(n)
}
