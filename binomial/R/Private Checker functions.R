# 1.1
# Check probability value function
# Description: Check if the probability value is valid
# Param: prob  The Probability that we check whether is valid (numeric)
# Return: a logical vector of whether prob is a valid probability
check_prob <- function(prob) {
  if ((prob <= 1) & (prob >= 0)) {
    return(TRUE)
  } else{
    stop("p has to be a number between 0 and 1")
  }
}


# Check trials value function
# Description: Check if the trials value is valid
# Param: trials  The trials that we check whether is valid
# Return: A logical vector of whether prob is a valid probability
check_trials <- function(trials) {
  if ((trials >= 0) & (trials %% 1 == 0)) {
    return(TRUE)
  } else{
    stop("invalid trials value")
  }
}

# Check success value function
# Description: Check if the success value is valid
# Param: success The success value that we check whether is valid
# Param: trials  The trials value that we check whether is valid
# Return: A logical vector of whether the success is a valid probability
check_success <- function(success, trials) {
  if (all((success <= trials) &
          (success >= 0) & (success %% 1 == 0))) {
    return(TRUE)
  } else{
    stop("invalid success value")
  }
}
