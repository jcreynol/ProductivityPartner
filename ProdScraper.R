library(rvest)
library(stringr)
library(dplyr)

site <- read_html("https://www.youtube.com/watch?v=t-Cug6D0bCc")

if (str_detect("buzzfeed.com", "[.edu|.gov]$")) {
  
}

totalPictures <- site %>%
                   html_nodes(xpath = '//*/img')

totalLinks <- site %>% 
                html_nodes(xpath = '//*/a')

totalParagraphs <- site %>%
                    html_nodes(xpath = '//*/p')

totalTables <- site %>%
  html_nodes(xpath = '//*/table')

totalVideos <- site %>%
  html_nodes(xpath = '//*/video')

totalButtons <- site %>%
  html_nodes(xpath = '//*/button')

totalText <- site %>% 

totalPictures <- bind_rows(lapply(xml_attrs(totalPictures), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalLinks <- bind_rows(lapply(xml_attrs(totalLinks), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalParagraphs <- bind_rows(lapply(xml_attrs(totalParagraphs), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalTables <- bind_rows(lapply(xml_attrs(totalTables), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalVideos <- bind_rows(lapply(xml_attrs(totalVideos), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalButtons <- bind_rows(lapply(xml_attrs(totalButtons), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))


totalPictures <- nrow(totalPictures)
totalLinks <- nrow(totalLinks)
totalParagraphs <- nrow(totalParagraphs)
totalTables <- nrow(totalTables)
totalVideos <- nrow(totalVideos)
totalButtons <- nrow(totalButtons)


mydf <- data_frame(totalPictures, totalLinks, totalParagraphs, totalTables, totalVideos, totalButtons)




head(mydf)
