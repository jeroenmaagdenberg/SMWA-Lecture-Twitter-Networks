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



# --- Filtering the Search --- #

# --- For network Visualization --- #

# --- Saving the data --- #

