rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

# install.packages("janeaustenr") # install.packages("stringr") rm(list = ls())
library(janeaustenr)
library(dplyr)
library(stringr)
library(tidyverse)
library(tidytext)
sentiments

get_sentiments("afinn")
get_sentiments("nrc")
get_sentiments("bing")


original_books <- austen_books() %>% group_by(book) %>% mutate(
  linenumber = row_number(), chapter = cumsum(str_detect(text,
  regex("^chapter [\\divxlc]", ignore_case = TRUE)))) %>% ungroup()
# words from all novels View(original_books)

tidy_books <- original_books %>%
  #make a set of words from the paragraphs
  unnest_tokens(word, text) 
str(tidy_books)

data("stop_words")
str(stop_words)
cleaned_books <- tidy_books %>% anti_join(stop_words) 
# anti_join() Note: anti_join() return all rows from x without a match in y.

cleaned_books %>% 
  count(word, sort = TRUE) 

#install.packages("textdata")
library(textdata)
# Note: enter '1', if prompted
nrcjoy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")
tidy_books %>%
  filter(book == "Emma") %>%
  semi_join(nrcjoy) %>%
  count(word, sort = TRUE)


########
tidy_book_counts <- tidy_books %>%
  filter(book == "Emma") %>%
  semi_join(nrcjoy) %>%
  count(word, sort = TRUE)

library(plotly)

#ggplot(data = tidy_book_counts) + geom_bin_2d(mapping = aes(x = word, y = n ))


p <- ggplot(tidy_book_counts, aes(x = word, y = n ))
p <- p + geom_point() 
p <- ggplotly(p) 
p

####

tidy_books %>%
  filter(book == "Emma") %>%
  semi_join(nrcjoy) %>%
  count(word, sort = TRUE)


library(tidyr)
bing <- get_sentiments("bing")
# move line by line of book, find difference in sentiments to "score" each line
janeaustensentiment <- tidy_books %>%
  inner_join(bing) %>%
  count(book, index = linenumber %/% 80, sentiment)           %>% spread(sentiment, n, fill = 0) %>%                     mutate(sentiment = positive - negative)

# Count the common positive words across the books.

bing_word_counts <- tidy_books %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()

str(bing_word_counts)


# plot the sentiments from each book
ggplot(janeaustensentiment, aes(index, sentiment, fill = book)) + geom_bar(stat = "identity", show.legend = TRUE) + facet_wrap(~book, ncol = 2, scales = "free_x")


# Plot the common positive words across the books.

bing_word_counts %>%
  filter(n > 150) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab("Contribution to sentiment")


bing_word_counts <- tidy_books %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()

bing_word_counts

###

# Takes less time
ggplot(bing_word_counts, aes(x = word, y = n, col = sentiment )) + geom_point()

# Takes a long time to plot ... :-(
p <- ggplot(bing_word_counts, aes(x = word, y = n, col = sentiment ))
p <- p + geom_point() 
p <- ggplotly(p) 
p

####


bing_word_counts %>%
  group_by(sentiment) %>%
  top_n(10) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment",
       x = NULL) +
  coord_flip()

