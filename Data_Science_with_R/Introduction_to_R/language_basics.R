# language_basics.R
# Handling R syntax
# date: 2017-07-28
# -------------------------------------------------------

# variables declaration
bool_var <- TRUE
lint_var <- 123L
float_var <- 1.23
string_var <- "123 ABC"
date_var <- as.Date("2017-07-28")

# variables display
bool_var
lint_var
float_var
string_var
date_var

# declaring function
test_func <- function(x) {
    x + 1
}
test_func(1)  # expected: 2

# -------------------------------------------------------
#                                         DATA STRUCTURES
# -------------------------------------------------------
# declaring a vector
test_vec <- c(1, 2, 3)
test_vec

# declaring a sequence
test_seq <- 1:5
test_seq

# declaring a matrix
test_mat <- matrix(
    data = 1:6,
    nrow = 2,
    ncol = 3
)
test_mat

# declaring an array
test_arr <- array(
    data = 1:8,
    dim = c(2, 2, 2)
)
test_arr

# declaring a list
test_list <- list(TRUE, 123L, 2.34, "abc")
test_list

# declaring a factor
categories <- c("Male", "Female", "Male", "Male", "Female")
test_fac <- factor(categories)
test_fac
levels(test_fac)
unclass(test_fac)

# declaring a data frame
test_df <- data.frame(
    name = c("Cat", "Dog", "Cow", "Pig"),
    how_many = c(5, 10, 15, 20),
    is_pet = c(TRUE, TRUE, FALSE, FALSE)
)
test_df

# playing with data frames calls 
test_df[1, 2]          # specific cell [row, col]
test_df[1, ]            # specific row
test_df[, 2]           # specific column
test_df[["how_many"]]  # -------- ------
test_df$how_many       # -------- ------ (prefered version)

# subsetting a data frame
test_df[c(2, 4), ]                        # multiple rows
test_df[2:4, ]                            # using a sequence (including)
test_df[c(TRUE, FALSE, TRUE, FALSE), ]    # indicating the ones we want (TRUE)
                                          # and the ones we don't (FALSE)
test_df[test_df$is_pet == TRUE, ]             # filtering (condition)
test_df[test_df$how_many > 10, ]              # --------- (---------)
test_df[test_df$name %in% c("Cat", "Cow"), ]  # --------- (---------)

# -------------------------------------------------------
#                                              OPERATIONS
# -------------------------------------------------------
1 + 2                    # expected 3
c(1, 2, 3) + c(4, 5, 6)  # expected 5 7 9 (c(1+4, 2+5, 3+6))
test_func(c(1, 2, 3))    # expected 2 3 4
                         # (c(test_func(1), test_func(2, test_func(3))))

# -------------------------------------------------------
#                                           FUNCTION CALL
# -------------------------------------------------------
test_mat_1 <- matrix(            # calling using explicit parameters names
    data = 1:6,
    nrow = 2,
    ncol = 3
)
test_mat_2 <- matrix(1:6, 2, 3)    # calling using implicit parameters names
test_mat_1 == test_mat_2           # vectorized equality test
identical(test_mat_1, test_mat_2)  # scalar equivalent

# -------------------------------------------------------
#                                USING EXTERNAL LIBRARIES
# -------------------------------------------------------

# To install new packages : install.packages("dplyr")
library("dplyr")
