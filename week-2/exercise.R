## Part 1: Debugging

my_num <- 6
initials <- "?. ?."

my_vector <- c(my_num, initials)

# run ?sum to get more info
vector_sum <- sum(my_vector)

# Describe why this doesn't work: 
# Because my_num is an int type while intitials is a string type. Two different types cannot add together

install.packages("stringr")


my_line <- "Hey, hey, this is the library"

print(str_length(my_line))

# Describe why this doesn't work: 
# didn't load the library

said_the_famous <- paste(my_line, " - ", initial)

# Describe why this doesn't work: 
# initial is not defined. Should be initials


## Part 2 - Vector and function practice

# Make a vector and use typeof to check what type R considers it to be
vec <- c(1,2,3,4,5)
typeof(vec)
# Write a function `CompareLength` that takes in 2 vectors, and returns the sentence:
# "The difference in lengths is N"
vec2 <- c(1,2,3,4,5,6)
CompareLength <- function(vec1,vec2){
  N <- abs(length(vec1) -length(vec2))
  paste("The difference im lengths is", N)
} 

# Pass two vectors of different length to your `CompareLength` function
CompareLength(vec, vec2)

# Write a function `DescribeDifference` that will return one of the following statements:
# "Your first vector is longer by N elements"
# "Your second vector is longer by N elements"
DescribeDifference <- function(vec1,vec2){
  N <- abs(length(vec1) -length(vec2))
  if(length(vec1)>length(2)){
    paste("Your first vector is longer by",N,"elements")
  } else {
    paste("Your second vector is longer by",N,"elements")
  }
}
# Pass two vectors to your `DescribeDifference` function
DescribeDifference(vec,vec2)

# Write a function `CombineVectors` that takes in 3 vectors and combines them into one
CombineVectors <- function(vec1,vec2,vec3){
  new_vec <- c(vec1, vec2, vec3)
  new_vec
}
# Send 3 vectors to your function to test it.
vec3 <- c(1,1,1)
CombineVectors(vec,vec2,vec3)
# Write a function `CapsTime` that takes in a vector of names of courses you're taking, ex "Informatics 201" and removes all capital letters
CapsTime <- function(courses) {
  return(gsub("[A-Z]","", courses))
}

CapsTime(c("ACMS", "Bioethics", "Math"))