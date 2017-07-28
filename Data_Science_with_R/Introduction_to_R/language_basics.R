# language_basics.R
# Handling R syntax
# date: 2017-07-28
# -------------------------------------------------------

# variables declaration
b <- TRUE
li <- 123L
x <- 1.23
s <- "123 ABC"
d <- as.Date("2017-07-28")

# variables display
print(b)
print(li)
print(x)
print(s)
print(d)

# declaring function
f <- function(x) {
    x + 1
}
print(f(2))

# declaring a vector
vec <- c(1, 2, 3)
print(vec)
