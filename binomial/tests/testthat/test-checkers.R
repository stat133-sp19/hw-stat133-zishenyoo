library(testthat)
context("tests for Checker functions")

# Test check_prob
test_that("Test if the check_prob works",{
  expect_true(check_prob(0.1))
  expect_error(check_prob(1.5))
  expect_length(check_prob(1/3),1)
  expect_type(check_prob(1/2), "logical")

} )

# Test check_trials
test_that("Test if the check_trials works",{
  expect_true(check_trials(5))
  expect_error(check_trials(-10))
  expect_length(check_trials(15),1)
  expect_type(check_trials(1),"logical")
})

# Test check_success
test_that("Test if the check_success works",{
  expect_true(check_success(8,9))
  expect_error(check_success(10,9))
  expect_length(check_success(3,9),1)
  expect_type(check_success(112,1331),"logical")
} )
