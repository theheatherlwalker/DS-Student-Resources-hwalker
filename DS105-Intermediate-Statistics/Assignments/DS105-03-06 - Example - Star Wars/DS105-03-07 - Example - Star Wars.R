# DS105-03-06 - Example - Star Wars
###############################################################################

#==============================================================================
# INSTALL AND LOAD LIBRARIES

library("dplyr")

#==============================================================================
# LOAD DATA
SW_survey_renamed <- read.csv("./assets/SW_survey_renamed.csv")

  # VIEW THE DATA
  View(SW_survey_renamed)

#==============================================================================
# QUESTION SETUP
  # You found something online that mentioned that 90% of people are
  # Star Wars fans, and you want to see if that holds true in your own survey.
  # In this way, you are comparing your sample (the survey) to the population
  # at large (what you read online).

  
#==============================================================================
# DATA WRANGLING
  # This data is already formatted correctly for an independent Chi-Square.
  
  
#==============================================================================
# TESTING ASSUMPTIONS AND RUNNING THE ANALYSIS
  # CrossTable() -- to create Chi-Square
  # fisher=TRUE -- use Fisher's Exact Test method to calculate effect size
  # chisq=TRUE -- get results from your Chi-Square
  # expected=TRUE -- provide expected frequencies
  # format="SPSS" -- will print expected frequencies
  # sresid=TRUE -- provides standardized residuals, to use later for effect sizes
  
CrossTable(SW_survey_renamed$Age, SW_survey_renamed$RankI, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

#==============================================================================
# CHECK ASSUMPTION OF EXPECTED FREQUENCIES  
  # You will want to look in the second row in each cell to find the expected
  # frequency. Ideally, you want to have the expected value greater than 5 for
  # each cell, but that's a pipe dream typically. You are technically allowed
  # to have 20% of your cells with 5 or less, as long as none of them are zero.
  # Luckily, you have no zeros here, and it looks like although there are some
  # cells that have values less than five, only 6/30 have that, which happens
  # to be 20%! So you are golden, and meet the assumption for Chi-Square.
  # You can now proceed to interpret your results!
  
#==============================================================================
# INTERPRET RESULTS
  # The results are shown at the bottom of your output, under the heading
  # Pearson's Chi-squared test. If the p value is less than .05, than this
  # analysis is significant, meaning that age does in fact make a difference
  # in how people rank Episode I.
  
#==============================================================================
# POST HOC
  # "People either loved or hated Episode I.
  #  Those who did not disclose their age, those who were 30-44 or over
  #  60 years old were more likely to rank Episode I as their favorite.
  #  Those over 45 years old were less likely to to rank Episode I as their
  #  least favorite,
  #  and those over 60 years old were less likely to rank Episode I fifth.
  #  Those in the 30-44 year old age group were more likely to rank Episode I
  #  last, however."
  