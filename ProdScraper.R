library(rvest)
library(stringr)
library(dplyr)
library(RCurl)
library(XML)
withoutTimeout
trainingSet <- read.csv("traindraft.csv")
head(trainingSet)
trainingSet[28, 1]
for (i in 1:nrow(trainingSet)) {
  (site <- read_html(as.character(trainingSet[i, 1])))
  
  totalPictures <- site %>%
    html_nodes(xpath = '//*/img')
  
  totalLinks <- site %>% 
    html_nodes(xpath = '//*/a')
  
  totalParagraphs <- site %>%
    html_nodes(xpath = '//*/p')
  
  totalText <- site %>%
    html_nodes(xpath = '//*/p') %>% html_text()
  totalText <- paste(totalText, collapse = '')
  totalText <- removeWords(totalText, stopwords("english"))
  totalText <- gsub("([0-9]|\r|\n| )", "", totalText)
  
  
  totalTables <- site %>%
    html_nodes(xpath = '//*/table')
  
  totalVideos <- site %>%
    html_nodes(xpath = '//*/video')
  
  totalButtons <- site %>%
    html_nodes(xpath = '//*/button')
  
  
  totalPictures <- bind_rows(lapply(xml_attrs(totalPictures), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  totalLinks <- bind_rows(lapply(xml_attrs(totalLinks), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  totalParagraphs <- bind_rows(lapply(xml_attrs(totalParagraphs), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  totalTables <- bind_rows(lapply(xml_attrs(totalTables), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  totalVideos <- bind_rows(lapply(xml_attrs(totalVideos), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  totalButtons <- bind_rows(lapply(xml_attrs(totalButtons), function(x) data.frame(as.list(x), stringsAsFactors=FALSE)))
  print("Hello!")
  
  totalPictures <- nrow(totalPictures)
  totalLinks <- nrow(totalLinks)
  totalParagraphs <- nrow(totalParagraphs)
  totalTables <- nrow(totalTables)
  totalVideos <- nrow(totalVideos)
  totalButtons <- nrow(totalButtons)
  
  mydf <- bind_rows(mydf, trainingSet[i,], data_frame(totalPictures, totalLinks, totalParagraphs, totalTables, totalVideos, totalButtons, totalText))
}


#scale data

#scale(mydf)
#remove correlations or zero variance
# bind_rows(y, z)  # adds rows to df
#

site <- read_html("https://stackoverflow.com/questions/5992082/how-to-remove-all-whitespace-from-a-string")
if (str_detect("buzzfeed.com", "[.edu|.gov]$")) {
  
}

totalPictures <- site %>%
  html_nodes(xpath = '//*/img')

totalLinks <- site %>% 
  html_nodes(xpath = '//*/a')

totalParagraphs <- site %>%
  html_nodes(xpath = '//*/p')

totalText <- site %>%
  html_nodes(xpath = '//*/p') %>% html_text()
totalText <- paste(totalText, collapse = '')
totalText <- removeWords(totalText, stopwords("english"))
(totalText <- gsub("([0-9]|\r|\n| )", "", totalText))


totalTables <- site %>%
  html_nodes(xpath = '//*/table')

totalVideos <- site %>%
  html_nodes(xpath = '//*/video')

totalButtons <- site %>%
  html_nodes(xpath = '//*/button')


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


mydf <- data_frame(totalPictures, totalLinks, totalParagraphs, totalTables, totalVideos, totalButtons, totalText)

head(mydf)
