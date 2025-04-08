#using for() loop functions 

#Q1. Try copying the code into a new script and move the print(x) command into the loop. What do you see?
x <- 0 
for (i in 1:10) {
  x <- x + i 
  print (x)
  }

#Q2. Try changing the numbers in the for() function (1:10) to numbers of your choosing multiple times. What do you see?
x <- 0
for (i in 2:20) {
  x <- x + i 
  print (x)
}

#Q3. Try changing the the name of i in the for() function to a name of your choosing and get the loop to run.
x <- 0
for (cat in 1:10) {
  x <- x + i 
  print (x)
} 
# NOTE: curly brackets show start and end of loop, print added into the curly brackets to add into the function making it a component of the loop.
# i can be changed to any character or number 

#Q4. Make a for loop that loops over the numbers 10 to 20, and prints the square of each.
x <- 0 
for (i in 10:20) {
  y <- i*i
  print (y)
}

#replacing 'i' with word LOOPING OVER NON-INTEGER VECTORS
shrek_quote <- c('What', 'are', 'you', 'doing', 'in', 'my', 'swamp')
for (word in shrek_quote) {
  print(toupper(word))  
}
#Try running the following version of the code where word has been changed to donkey and a numeric vector is used instead of a character vector to the same effect.

#In the above for loop what is the function of each of the following parts: (a) donkey (b) toupper() (c) 1:length() (d) shrek_quote (e) shrek_quote[donkey]?
# (a) donkey = iterator 
# (b) toupper = convert all of lower case to upper case 
# (c) 1:length = looking at the length of a vector 
# (d) shrek_quote = the vector that is being looked at 
# (e) shrek_quote[donkey] = function selecting each word one by one 

# Saving outputs using output vectors 
#Example
output <- vector() # creates an empty vector that we can fill with values
input <- c('red', 'yellow', 'green', 'blue', 'purple')
for (i in 1:length(input)) {
  output[i] <- nchar(input[i])
}
print(output)

#What does the nchar() function do?
# the nchar() function is used to count the length of each string 

#Q5. Create a for loop that takes a vector named fruits with the elements 'apple' 'tangerine' 'kiwi' and 'banana', adds an underscore and the number of characters to each of them, and saves them as a new vector called fruit_chars. Hint: The function paste() is your friend, look it up! Your output should be like so:
fruit_char <- vector()
fruits<- c('apple', 'tangerine','kiwi', 'banana')
for (i in 1:length (fruits)) {
  fruit_char[i] <- paste(fruits[i], nchar(fruits[i]), sep ='_')
}
print(fruit_char)

#Conditional statements 
# evaluate whether certain conditions are true or not in R, and carry out tasks based on the outcome of that statement

# EXAMPLE
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i > 5){
    print(i)
  }
}
# note: When the conditional statement of i > 5 is TRUE (or rather i > 5 == TRUE!) the loop runs the print(i)

#Q6. How does the conditional statement in the above code work?
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  }
}
# Answer: if a number in the vector is less than 5 and is divisible by 1 and is an integer- print the condition in words

#Q7. What does the paste() function do in the above code?
# Takes multiple elements from multiple vectors and combines them into a single element

#Q8. Create your own if statement inside a loop over the numeric vector nums below. Be creative with what your conditional statement is, but make sure you have an appropriate print output like the example above!
nums <- c(1,2,3,4,5,6,7,8)
for (i in nums){
  if(i <6 & i %% 2) {
    print (paste (i, 'is less than 6 and is divisible by 2 ', sep = ''))
  }
}

# Using else loop function 
# Example 
numbers <- c(1, 4, 7, 33, 12.1, 180000,-20.5)
for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else {
    print(paste(i, ' is not less than five or is not an integer (or both!).', sep = ''))
  }
}

#Q8. Update your for loop with an if() statement to also contain an else statement (of your choice again!).
nums <- c(1,2,3,4,5,6,7,8)
for (i in nums){
  if(i <6 & i %% 2) {
    print (paste (i, 'is less than 6 and is divisible by 2 ', sep = ''))
  } else if (i <6 & i %% 2 !=0) {
    print(paste (i, 'is not divisible by 2', sep = ''))
  } else if (i >= 6 & i %% 2){
    print(paste(i, 'is greater than 6', sep = ''))
  }else {
    print(paste(i, 'is greater than 6 and is not divisble by 2', sep= ''))
  }
}

# While loops 
# they loop over a section of code within curly brackets {}. Instead of giving loops an object to iterate over (usually a vector), while loops will instead take a conditional statement
# loop if statement is true
# Example
x <- 0
while(x < 5){
  x <- x + 1
  print(paste('The number is now ', x, sep = ''))
}
#Q9. Why does the code stop running after 5 iterations?
# because there are only 5 numbers that are less than 5 when x is classified as 0

#Q10. Why does x reach a value of 5 and not 4?
# x has been classified as 0 so 1 needs to be counted in 

#Example 
x <- 1
while(x %% 5 != 0 | x %% 6 != 0 | x %% 7 != 0){
  x <- x + 1
}
print(paste('The lowest number that is a factor of 5, 6 and 7 is ', x, sep = ''))

#Q11. What does the logical statement x %% 5 != 0 check in the above code?
# statement checks if the remainder when x is divided by 5 is not equal to 0

#Q12. Why does the code not work if x starts as 0?
# the code doesn't work because 0 is not divisible by any integer, loop will therefore fail on the first go giving a false logical output 

#13. Make your own loop that takes a starting value of x <- 0.999 that squares x in each loop until x is less than 0.5.
x <- 0.999
while (x < 0.5){
x <- x * x
}

#Functions 
#Example
powers <- function(x){
  y <- x ^ 2
  return(y)
}
powers(5)
# function squares the number in the powers() e.g 30 = 900, 1= 2
# NOTE: basic syntax of creating a function is to define its name (in this case powers) and inputs (in this case x), and then place the code that the function is composed of in the curly brackets. Most functions will also define an output using the return() function.

powers <- function(x){
  y <- x ^ 2
  z <- x ^ 3
  return(c( y, z))
}
powers(2)
# can use same function and instruct square and cube as shown in example code above 

#default input
#Q14. Write a function that takes a character scalar (e.g. 'Bird') and returns a character scalar that appends is the word on the end of the word (e.g. ’Bird is the word').

word <- function(x){
  y <- paste(x, 'is the word', sep = ' ')
 return (y)
}
word('Lion')
# should be running but left an open bracket somewhere in previous code, so not running 

bird <- function(x){
  y <- gsub(pattern = '$', x = x, replacement = ' is the word')
  return(y)
}
# code solution given in answers --> but doesn't print out code output in console, the code above is correct works 

#Q15 Edit the above function so that it appends a second input scalar (e.g. 'is not the word'), with the function defaulting to append 'is the word' if no second scalar is provided.
word <- function(x, y= 'is the word') {
    z <- paste(x, 'is not the word', sep= '')
    print(z)
}
word('Lion')
# adding a second input scalar into the first function created 

bird <- function(x, y = ' is the word'){
  z <- gsub(pattern = '$', x = x, replacement = y)
  return(z)
}
# this code was also given as solution but doesn't print out code output in console 

#Challenge
# Q1. Make a for loop that iterates over the numeric vector c(1,1,3,5,8,13,21) and prints the square root of each of the numbers.
numbers <- c(1,1,3,5,8,13,21)
for (i in numbers){
  print(sqrt(i))
}
#sqrt func is for getting the square root of the vector list. num= takes value of each element in numbers vector, in order.

#Q2. Create a vector of a quote from your favourite film (each word should be a single element). Loop over the words and print all words that are 4, 5 or 6 characters long, print 'too short' instead when the words are < 4 characters long and print 'too long' if they are more than 6 characters long.

quote <- c('I', 'am', 'the', 'king', 'of', 'the', 'world', 'tomorrow')
for (i in quote) {
  word_length <- nchar(i)  # Get the length of the word
  
  if (word_length < 4) {
    print('too short')
  } else if (word_length >= 4 & word_length <= 6) {
    print(i)  # Print words that are 4, 5, or 6 characters long
  } else if (word_length > 6) {
    print('too long')
  }
}
# word_length used to determine length of the words in quote vector 
#>=4 <=6 length of word is 5

quote <- c('I', 'am', 'the', 'king', 'of', 'the', 'world', 'tomorrow')
for (i in quote) {
  if(nchar(i) == 4 | nchar(i) == 5 | nchar(i) == 6){
    print(i)
  } else if(nchar(i) < 4){
    print('too short')
  } else {
    print('too long')
  }
}
# also have this solution where can assign the 4,5,6 in single line 
# use nchar to determine the length of the elements in the quote vector 
# for functions looking at length need to use else if, else and for loop functions 

#Q3 update the above for loop to save all the printed outputs into a new vector called garbled_film_quote.
quote <- c('I', 'am', 'the', 'king', 'of', 'the', 'world', 'tomorrow')
garbled_film_quote <- vector()
for (i in 1: length(quote)) {
  garbled_film_quote[i] <-nchar(quote[i])
}
print(garbled_film_quote)
#quote vector is input, new vector name 'garbled_film_quote' is output
#nchar(quote[i]) --> calculates the number of characters in each word and stores it in garbled_film_quote[i]
# 1: length(quote) --> generates numeric sequence

#Q4 Create a function that converts a character scalar of a month into the number of the position of said month in the year (e.g. an input of 'May' will return 5 or an input of 'November' will return 11). 
month_to_number <- function(month_name) {
  months <- c( "January", "February", "March", "April", "May", "June", "July", "August", "September","October", "November", "December")
  month_number <- match(month_name, months)
  if (is.na(month_position)) {
    stop("Invalid month name")
  return(month_position)
}
}
# code above is incorrect --> use the solution code provided below 

month_converter <- function(month){
  months <- c('January','February','March',
              'April','May','June',
              'July','August','September',
              'October','November','December')
  return(grep(pattern = month, x = months))
}

# 5) Edit the above function to take a vector of months and return a vector of number positions. E.g. 'May', 'June' returns 5,6

month_converter <- function(month_vec){
  months <- month.name #Make vector with months using built-in constant
  output <- vector() #Empty vector
  for (i in 1:length(month_vec)) {
    output[i] <- grep(pattern = month_vec[i], x = months)
  }
  return(output)
}


