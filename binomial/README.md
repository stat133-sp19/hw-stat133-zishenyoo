README
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"binomial"` is an R package that lets the user calculate and display the properites of the binomial distribution and variable. Functions include:

-   `bin_choose()` finds the number of ways to choose k items from n
-   `bin_probability()` finds the probability of a particular number of successes
-   `bin_distribution()` creates a `"bindis"` and `"data.frame"` object that can be visualized with `plot()`
-   `bin_cumulative()`creates a `"bincum"` and `"data.frame"` object that can be visualized with `plot()`
-   `bin_variable()` creates a `"binvar"` object that can be summarized with `summary()`
-   `bin_mean()` finds the mean
-   `bin_variance()` finds the variance
-   `bin_mode()` finds the mode
-   `bin_skewness()` finds the skewness
-   `bin_kurtosis()` finds the kurtosis

Motivation
----------

This package was developed to learn the basics of creating a package. The binomial distribution is a simple concept to implement in code, so it is great for learning as a proof of concept.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("hw-stat133-zishenyoo/binomial")
# install "binomial" (with vignettes)
devtools::install_github("hw-stat133-zishenyoo/binomial", build_vignettes = TRUE)
```

Author Information
------------------

-   Author: Zishen Liu
-   Email: <zishenliu@berkeley.edu>
-   School: UC Berkeley
-   Class: Stat 133 (Section 105)
-   Instructor: Gaston Sanchez
