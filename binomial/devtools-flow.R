# =====================================================
# Devtools workflow
#library(devtools)
# =====================================================

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build()             # build bundle
devtools::install()           # install package
