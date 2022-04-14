# plot_twitter_network.R
#
# Contributors:
#
# What this file does:
#   * Transforms returned Twitter data into a network of connections
#   * Plots retweet and Mentions networks

install.packages("ggraph","tidygraph")
yes
# --- Libraries --- #
library(readr)     # read/write files
library(dplyr)     # data manip
library(tidyr)     # data manip
library(tidygraph) # network data
library(ggraph)    # network viz

# --- Load Data --- #

tweets <- read_rds("data/fox_cnn.Rds")

# --- Retweet Network --- #

rt <- 
  tweets %>%
  filter(is_retweet == TRUE)

rt_edge <-
  rt %>%
  select(from = screen_name,
         to = retweet_screen_name
         ) %>%
  filter(from != to) %>% # filter out people who retweet themselves
  distinct() #only unique retweets, so if A retweets B 2 times, only 1 time is counted

rt_network <-
  as_tbl_graph(rt_edge)

ggraph(rt_network, layout = 'stress') +
  geom_node_point() + geom_edge_link() +
  theme_void()

ggraph(rt_network, layout = 'kk') +
  geom_node_point() + geom_edge_link(alpha = 0.2) +
  theme_void()


ggraph(rt_network, layout = 'fr') +
  geom_node_point() + geom_edge_link(alpha = 0.2) +
  theme_void()


# --- Mentions Network --- #

mnt <-
  tweets %>%
  select(
    from = screen_name,
    to = mentions_screen_name
  ) %>%
  filter(to != "NA")

mnt2 <- 
  mnt %>%
  unnest_longer(to) %>%
  filter(from != to)
