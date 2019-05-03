library(testthat)

context("Tests for Binomial functions")


#bin_choose
test_that("bin_choose is as expected", {
  expect_equal(bin_choose(n = 4, k = 1),4)
  expect_type(bin_choose(n = 5, k = 2),"double")
  expect_length(bin_choose(n = 3, k = 1),1)
  expect_error(bin_choose(5,-1))
  expect_error(bin_choose(10,2.1))
})

#bin_probability
test_that("bin_probability is as expected", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_type(bin_probability(success = 1, trials = 4, prob = 0.5), "double")
  expect_length(bin_probability(success = 5, trials = 7, prob = 0.5), 1)
  expect_error(bin_probability(10,-1,0))
  expect_error(bin_probability(-10,1,0.1))
})

#bin_distribution
test_that("bin_distribution is as expected", {
  expect_type(bin_distribution(trials = 10, prob = 0.5),"list")
  expect_length(bin_distribution(trials = 10, prob = 0.5), 2)
  expect_error(bin_distribution(5,2))
})

#bin_cumulative
test_that("bin_cumulative is as expected", {
  expect_type(bin_cumulative(trials = 15, prob = 0.5),"list")
  expect_length(bin_cumulative(trials = 10, prob = 0.5),3)
  expect_error(bin_cumulative(5,-2))
  expect_error(bin_cumulative(15,2))
  expect_error(bin_cumulative(15,1.5))
})
