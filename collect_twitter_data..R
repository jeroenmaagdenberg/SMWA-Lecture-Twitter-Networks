# collect_twitter_data.R
#
# Contributors:
#
# What this file does:
#   * Uses rtweet to harvest twitter data
#   * Shows various options available to restrict collection

# --- Libraries --- #
library(rtweet)  # Twitter API
library(readr)   # read/write files

#--- Basic API Usage ---#

tweets <- 
  search_tweets('#breakingnews')
View(tweets)
  
tweets <-
  search_tweets('#breakingnews',
                n = 2000)
tweets <-
  search_tweets('#breakingnews OR #cnn',
                n = 2000)
tweets <-
  search_tweets('#foxnews OR #cnn',
                n = 100,
                lang = "en")

geo_us <- lookup_coords("US")
geo_us2 <- read_rds("data/geo_us.rds")


  


# --- Filtering the Search --- #

tweets_us <- search_tweets('#foxnews OR #cnn',
                           n = 1500,
                           lang = "en",
                           geo = geo_us2)

# --- For network Visualization --- #

tweets_final <- 
  search_tweets(
    '#foxnews OR #cnn',
    n = 5000,
    lang = "en"
  )

# --- Saving the data --- #
write_rds(tweets_final,"data/fox_cnn.Rds")
