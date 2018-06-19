library(rvest)
library(stringr)
library(dplyr)

site <- read_html("https://www.buzzfeed.com/")

if (str_detect("buzzfeed.com", "[.edu|.gov]$")) {
  
}

totalPictures <- site %>%
                   html_nodes(xpath = '//*/img')

head(totalPictures)

totalLinks <- site %>% 
                html_nodes(xpath = '//*/a')

totalParagraphs <- site %>%
                    html_nodes(xpath = '//*/p')

totalPictures <- bind_rows(lapply(xml_attrs(totalPictures), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalLinks <- bind_rows(lapply(xml_attrs(totalLinks), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalParagraphs <- bind_rows(lapply(xml_attrs(totalParagraphs), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
totalPictures <- nrow(totalPictures)
totalLinks <- nrow(totalLinks)
totalParagraphs <- nrow(totalParagraphs)
mydf <- data_frame(totalPictures, totalLinks, totalParagraphs)




head(mydf)

#totalPictures <- site %>%
#  html_nodes("amcharts") %>%
#  html_text()



# pictures
# pictures vs. text
# links vs. text
# links vs. pictures


# tags, words, frequency of words


