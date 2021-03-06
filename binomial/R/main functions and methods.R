#1.3
#' @title binomial choose function
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of success
#' @return the number of combinations in which k successes can occur in n trials
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5,0)
#' bin_choose(5,1:3)
#' @export
bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop("k cannot be greater than n")
  }  else if (check_success(k, n)) {
    return(factorial(n) / (factorial(k) * factorial(n - k)))
  }
}

#' @title binomial probability function
#' @description computes the binomial probability given certain number of successes, probability and trials
#' @param success number of success
#' @param trials number of trials
#' @param prob Probability of success in one trial
#' @return the binomial probability given certain number of successes, probability and trials
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' @export
bin_probability <- function(success, trials, prob) {
  if (check_trials(trials) != TRUE) {
    stop("invalid trials value")
  } else if (check_prob(prob) != TRUE) {
    stop("invalid probability value")
  } else if (check_success(success, trials) != TRUE) {
    stop("invalid success value")
  } else{
    p <-
      bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials -
                                                                        success))
    return(p)
  }
}

# 1.5
#' @title binomial distribution function
#' @description calculates the probability of different number of success trials
#' @param trials number of trials
#' @param prob success rate of each trials
#' @return A data frame with number of success and its probability
#' @example
#' bin_distribution(trials = 5, prob = 0.5)
#' class(bin_distribution(trials = 5, prob = 0.5))
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
#' @export
bin_distribution <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  table1 <- data.frame(success, probability)
  class(table1) <- c("bindis", "data.frame")
  return(table1)
}


#' @export
plot.bindis = function(bindis, ...) {
    barplot(
    bindis$probability,
    xlab = 'successes',
    ylab = 'probability',
    names.arg = bindis$success,
    las = 1,
    border = NA
  )
}

# 1.6
#' @title binomial cumulative function
#' @description calculates the probability and cumulative probability of different success times
#' @param trials number of trials
#' @param success success rate of each trials
#' @return A data frame with number of success, probability and cumulative probability
#' @examples
#' bin_cumulative(5,0.5)
#' @export

bin_cumulative <- function(trials, prob) {
  table2 <- bin_distribution(trials, prob)
  cum <- c()
  for (i in c(1:length(table2$probability))) {
    if (i == 1) {
      cum[i] <- table2$probability[i]
    } else{
      cum[i] <- cum[i - 1] + table2$probability[i]
    }
  }
  table2$cumulative <- cum
  class(table2) <- c("bincum", "data.frame")
  return(table2)
}

#' @export
plot.bincum <- function(bincum, ...) {
  plot(
    bincum$success,
    bincum$cumulative,
    type = 'o',
    xlab = "successes",
    ylab = 'probability',
    las = 1
  )
}

#1.7
#' @title Binomial Variable
#' @description Calculate and form a Binomial Random Variable
#' @param trials Number of trials (numeric)
#' @param prob Probability of success (numeric)
#' @return A Binomial Random Variable object with attributes of trials and probability
#' @examples
#' bin_variable(trials = 5, prob = 0.5)
#' @export
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binvar <- list(trials = trials, prob = prob)
  class(binvar) <- c("binvar")
  return(binvar)
}

#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob)
}

#' @export
summary.binvar <- function(binvar) {
  trials <- binvar$trials
  prob <- binvar$prob
  summarybinvar <- list(
    trials = binvar$trials,
    prob = binvar$prob,
    mean = aux_mean(trials, prob),
    variance = aux_variance(trials, prob),
    mode = aux_mode(trials, prob),
    skewness = aux_skewness(trials, prob),
    kurtosis = aux_kurtosis(trials, prob)
  )
  class(summarybinvar) <- c("summary.binvar", "list")
  return(summarybinvar)
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n\n")
  cat("- mean    :", x$mean, "\n\n")
  cat("- variance:", x$variance, "\n\n")
  cat("- mode    :", x$mode, "\n\n")
  cat("- skewness:", x$skewness, "\n\n")
  cat("- kurtosis:", x$kurtosis, "\n\n")
}



# 1.8
#' @title Binomial Mean
#' @description Computes the expected value of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Expected value of binomial distribution
#' @example
#' bin_mean(10,0.1)
#' @export
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial variance function
#' @description: Compute the variance of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the variance of binomial distribution
#' @example
#' bin_variance(10,0.1)
#' @export
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title: Binomial Mode function
#' @description: Compute the mode of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the mode of binomial distribution
#' @example
#' bin_mode(10,0.1)
#' @export
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title: Binomial Skewness function
#' @description: Compute the skewness of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the skewness of binomial distribution
#' @example
#' bin_skewness(10,0.1)
#' @export
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis function
#' @description: Compute the kurtosis of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the kurtosis of binomial distribution
#' @example
#' bin_kurtosis(10,0.1)
#' @export
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}


