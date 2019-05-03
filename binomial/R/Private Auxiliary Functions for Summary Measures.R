# 1.2
# Auxillary Mean function
# Description: Compute the expected value of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
#return the expected value of binomial distribution
#examples
#aux_mean(10, 0.3) = 3
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# Auxillary variance function
# Description: Compute the variance of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the variance of binomial distribution
#examples
#aux_variance(10, 0.3) = 2.1
aux_variance <- function(trials, prob) {
  return(trials * prob * (1 - prob))
}

# Auxillary Mode function
# Description: Compute the mode of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the mode of binomial distribution
#examples
#aux_mode(10, 0.3) = 3
aux_mode <- function(trials, prob) {
  return(as.integer(trials * prob + prob))
}

# Auxillary Skewness function
# Description: Compute the skewness of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the skewness of binomial distribution
#examples
#aux_skewness(10, 0.3) = 0.2760262
aux_skewness <- function(trials, prob) {
  skewness <- (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(skewness)
}

# Auxillary Kurtosis function
# Description: Compute the kurtosis of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the kurtosis of binomial distribution
#examples
#aux_kurtosis(10, 0.3) = -0.1238095
aux_kurtosis <- function(trials, prob) {
  kurtosis <-
    (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}

