# setup -------------------------------------------------------------------

library(devtools)
use_git()

library(devtools)
usethis::use_build_ignore("dev_history_r_pkg.R")
usethis::use_git_ignore("dev_history_r_pkg.R")
use_roxygen_md()
use_pipe()
library(magrittr)

options(usethis.full_name = "Jiaxiang Li")
use_mit_license()
usethis::use_code_of_conduct()

# rm -rf packrat

# desc --------------------------------------------------------------------

library(usethis)
add2pkg::create_desc()
author_info <- add2pkg::add_me(is_paste = TRUE)
desc_lines <- readr::read_lines("DESCRIPTION")
desc_lines[5] <- author_info
desc_lines %>% readr::write_lines("DESCRIPTION")
# file.edit("DESCRIPTION")
library(tidyverse)

# prettify ----------------------------------------------------------------

if (file.exists("README.Rmd")) {
    file.rename("README.Rmd", "README-bak.Rmd")
    file.edit("README-bak.Rmd")
}
use_readme_rmd()
read_lines("README.Rmd")[1:20] %>%
    c("") %>%
    c('`r add2pkg::add_disclaimer("Jiaxiang Li")`') %>%
    write_lines("README.Rmd")
file.remove("README-bak.Rmd")
file.edit("README.Rmd")
rmarkdown::render("README.Rmd")
rstudioapi::viewer("README.html")
file.remove("README.html")

# add commit --------------------------------------------------------------

git2r::add(path = ".")
glue::glue("Add metadata

1. license
1. readme
1. namespace
1. desc
1. coc
1. `%>%`
") %>% git2r::commit(message = .)



git2r::remote_add(name = "origin",
                  url = glue::glue("https://github.com/JiaxiangBU/{add2pkg::proj_name()}.git"))
git2r::push(name = 'origin', refspec = "refs/heads/master", cred = git2r::cred_token(),
            set_upstream = TRUE
            # Only one
            )

# coding ------------------------------------------------------------------

# add title

# build -------------------------------------------------------------------

library(devtools)
document()
load_all()

library(devtools)
document()
install()

use_build_ignore("docs")

# commit

git2r::add(path = ".")
git2r::commit(message = "update README with examples, add the function of `theme_grey_and_red`, update dev history")

# release -----------------------------------------------------------------

use_news_md()
file.edit("NEWS.md")
use_version()
usethis::use_github_release()

# publish -----------------------------------------------------------------

# open it and link it.
# https://zenodo.org/account/settings/github/
# push
# make public
use_news_md()
use_version()
file.edit("NEWS.md")
use_github_release()
rmarkdown::render("README.Rmd")
rstudioapi::viewer("README.html")
purrr::safely(file.remove)("README.html")
# 因为会更新 citations，但是要等一会。
# publish release


# add badge and citation --------------------------------------------------

# login zenodo and copy badge in markdown
clipr::write_clip('## Citations

```{r include=FALSE}
citations <- add2pkg::add_zenodo_citation("README.Rmd")
```

```{r echo=FALSE, results=\'asis\'}
cat(citations$Cite)
```

```{r echo=FALSE, results=\'asis\'}
cat(paste0("```BibTex\\n",citations$BibTex,"\\n```"))
```

```{r echo=FALSE, results=\'asis\'}
cat(citations$Comments)
```')
file.edit("README.Rmd")
# 需要等一段时间，有时候 doi 没有显示出来
rmarkdown::render("README.Rmd")
rstudioapi::viewer("README.html")
purrr::safely(file.remove)("README.html")

# add vignette ------------------------------------------------------------

use_vignette("lift_chart")

# pkgdown -----------------------------------------------------------------

start_time <- lubridate::now()
pkgdown::build_site()
end_time <- lubridate::now()
end_time - start_time

git2r::add(path = ".")
git2r::commit(message = "update pkgdown website")

# add examlpes ------------------------------------------------------------

clipr::read_clip() %>%
    stringr::str_c("#' ", .) %>%
    clipr::write_clip()

clipr::read_clip() %>%
    stringr::str_c("#' ", .) %>%
    stringr::str_flatten("\n") %>%
    stringr::str_c("#' \\donttest{", ., "}") %>%
    clipr::write_clip()

# return

clipr::read_clip() %>%
    stringr::str_remove("^#'") %>%
    clipr::write_clip()


# update template ---------------------------------------------------------

# update back
library(fs)
file.copy("dev_history_r_pkg.R", "../dev_history/refs/dev_history_r_pkg.R",
          overwrite = TRUE)
dev_history_repo <- git2r::repository("../dev_history")
library(magrittr)
dev_history_repo %>%
    git2r::status()
dev_history_repo %>%
    git2r::add(path = ".")
dev_history_repo %>%
    git2r::commit(message = "Update back.")
dev_history_repo %>%
    git2r::push(name = 'origin', refspec = "refs/heads/master", cred = git2r::cred_token())


# update now
fs::file_copy("../dev_history/refs/dev_history_r_pkg.R", "dev_history_r_pkg.R",
          overwrite = TRUE)


# push --------------------------------------------------------------------

git2r::push(name = 'origin', refspec = "refs/heads/master", cred = git2r::cred_token())
