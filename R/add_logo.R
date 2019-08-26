#' Add a logo into an image
#'
#' @importFrom magick image_info

get_width_height <- function(img) {
    img_obj <- magick::image_info(img)
    return(list(width = img_obj$width, height = img_obj$height))
}

#' @param plot_path image path.
#' @param logo_path logo image path.
#' @param logo_position the position of logo within the image.
#' @param logo_scale the size of logo relative to the image.
#' @import magick
#' @importFrom zeallot "%<-%"
#' @export

add_logo <-
    function(plot_path,
             logo_path,
             logo_position = c("top right", "top left", "bottom right", "bottom left"),
             logo_scale = 10) {
        # Useful error message for logo position
        logo_position = match.arg(logo_position)

        # read in raw images
        plot <- magick::image_read(plot_path)
        logo_raw <- magick::image_read(logo_path)

        # get dimensions of plot for scaling
        c(plot_width, plot_height) %<-% get_width_height(plot)

        # default scale to 1/10th width of plot
        # Can change with logo_scale
        logo <-
            magick::image_scale(logo_raw, as.character(plot_width / logo_scale))

        # Get width of logo
        c(logo_width, logo_height) %<-% get_width_height(logo)

        # Set position of logo
        # Position starts at 0,0 at top left
        # Using 0.01 for 1% - aesthetic padding

        if (logo_position == "top right") {
            x_pos = plot_width - logo_width - 0.01 * plot_width
            y_pos = 0.01 * plot_height
        } else if (logo_position == "top left") {
            x_pos = 0.01 * plot_width
            y_pos = 0.01 * plot_height
        } else if (logo_position == "bottom right") {
            x_pos = plot_width - logo_width - 0.01 * plot_width
            y_pos = plot_height - logo_height - 0.001 * plot_height
        } else if (logo_position == "bottom left") {
            x_pos = 0.01 * plot_width
            y_pos = plot_height - logo_height - 0.01 * plot_height
        }

        # Compose the actual overlay
        magick::image_composite(plot, logo, offset = paste0("+", x_pos, "+", y_pos))
    }
