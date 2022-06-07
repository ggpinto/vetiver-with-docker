library(vetiver)
library(pins)
#
# Board lives inside the project for this reprex only
#
b <- board_folder("board",versioned = TRUE)
cars_lm <- lm(mpg ~ ., data = mtcars)
v <- vetiver_model(cars_lm, "cars_linear")
vetiver_pin_write(b, v)
vetiver_write_plumber(b, "cars_linear")
vetiver_write_docker(v)
#
# This Dockerfile doesn't work because it doesn't expose the port and assumes
# that the container has access to the board (see plumber.R)
#
cat(readr::read_lines("Dockerfile"), sep = "\n")
cat(readr::read_lines("plumber.R"), sep = "\n")