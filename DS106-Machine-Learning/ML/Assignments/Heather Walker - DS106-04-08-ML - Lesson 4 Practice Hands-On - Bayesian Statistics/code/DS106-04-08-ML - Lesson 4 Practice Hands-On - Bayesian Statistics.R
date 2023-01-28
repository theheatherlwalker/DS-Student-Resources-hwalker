# DS106-04-08-ML - Lesson 4 Practice Hands-On - Bayesian Statistics

# ----------------------------------------------------
# A/B Testing and Monte Carlo Simulation
# ----------------------------------------------------

trials <- 10000

# Priors you created = 90% effective
alpha <- 9
beta <- 1

# *Bleach Alone*
# mold returned 27%
# mold did not return 39%
samplesA <- rbeta(trials, 27 + alpha, 39 + beta)

# *Bleach + Scrubbing*
# mold returned 10%
# mold did not return 45%
samplesB <- rbeta(trials, 10 + alpha, 45 + beta)


Bsuperior <- sum(samplesB > samplesA) / trials

# print results
Bsuperior


# ----------------------------------------------------
# RESULTS
# ----------------------------------------------------

# Bsuperior
# [1] 0.0133



# ----------------------------------------------------
# CONCLUSION
# ----------------------------------------------------

# There is a `0.1318%` chance that *Bleach Alone* (`A`)
# is 90% effective.