################################################################################
##
##                        챗GPT SQL 로고
##                      이광춘, 2024-01-17
##
################################################################################

# 1. AI 배경 이미지 ------------------------------------------------------------

library(tidyverse)
library(openai)
library(cropcircles)
library(magick)
library(showtext)
library(ggpath)
library(ggtext)
library(glue)

extrafont::loadfonts()

Sys.setenv(OPENAI_API_KEY = Sys.getenv("OPENAI_API_KEY"))

# x <- create_image("a amazing newspaper as the sun is rising behind many news full of fake and misinformation")
# x <- create_image("multicolor sparkly glitter bursting from the tip of an tomato as it touches the paper, bright, realism")
x <- create_image("draw Korean ink painting style landscape image, sephia tone, minimalism")
# from https://jehyunlee.github.io/2023/12/25/General-33-ChatGPT_DataAnalysis/



## 원본이미지 다운로드
download.file(url = x$data$url, destfile = "images/raw_image.png",
              mode = "wb")


# 2. 뉴스토마토 로고 ------------------------------------------------------------
## 2.1. 소스 이미지
sql_bg <- magick::image_read("images/raw_image.png")

sql_bg <- sql_bg %>%
  # image_resize(geometry = c(300, 300))
  image_resize('25%x25%')

## 2.2. 로고 추가작업
# bitTomato_logo <- image_composite(tomato_bg,
#                                   # newstomato_logo %>% image_resize(geometry = c(130, 130)) %>%
#                                   newstomato_logo |> image_resize('10%x10%') |>
#                                     image_transparent(color = 'white'),
#                                   offset = "+80+140", operator = "atop")


# 3. 텍스트 ------------------------------------------------------------

font_add_google('inconsolata', 'Inconsolata')
font_add_google('Dokdo', 'dokdo')
# 글꼴 다운로드 : https://fontawesome.com/download
font_add('fa-brands', 'data-raw/fonts/Font Awesome 6 Brands-Regular-400.otf')
showtext_auto()
ft <- "dokdo"
ft_github <- "inconsolata"
txt <- "white"

pkg_name <- "챗GPT SQL"

img_cropped <- hex_crop(
  images = sql_bg,
  border_colour = "#403b39",
  border_size = 5
)

sql_gg <- ggplot() +
  geom_from_path(aes(0.5, 0.5, path = img_cropped)) +
  annotate("text", x = 0.39, y = 0.08, label = pkg_name,
           family = ft, size = 35, colour = txt,
           angle = 30, hjust = 0, fontface = "bold") +
  # add github
  annotate("richtext", x=0.55, y = 0.05, family = ft_github,
           size = 12, angle = 30,
           colour = txt, hjust = 0,
           label = glue("<span style='font-family:fa-brands; color:{txt}'>&#xf09b;&nbsp;</span> bit2r/gpt-sql"),
           label.color = NA, fill = NA)   +
  xlim(0, 1) +
  ylim(0, 1) +
  theme_void() +
  coord_fixed()

sql_gg

ragg::agg_png("images/logo.png",
              width = 4.39, height = 5.08, units = "cm", res = 600)
sql_gg
dev.off()

