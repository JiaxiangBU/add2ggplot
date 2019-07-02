#' export
theme_ilo <- function(){
    theme_minimal() +
        theme(
            # text = element_text(family = "Bookman", color = "gray25"),
            plot.subtitle = element_text(size = 9),
            plot.caption = element_text(color = "gray30"),
            # plot.background = element_rect(fill = "gray95"),
            plot.margin = unit(c(5, 10, 5, 10), units = "mm"),
            axis.title.x = element_text(size=12,face = "bold"),
            axis.title.y = element_text(size=12,face = "bold"),
            # x和y的命名，要加粗，ppt才好看
            axis.text.x = element_text(size=7, angle = 70, hjust = 1),
            # 控制axis字体大小，7号大小最好
            axis.text.y = element_text(size=7),
            legend.title=element_blank()
        )
}
