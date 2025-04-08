# creating vectors and using new functions to identify input positions

quote <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out')
grep_out <- grep(pattern = 'the', x= quote)
grep_out 
# used the grep_out function to identify all of 'the' in the quote variable
# pattern in the code = the variable we are searching for, the x= the vector we are searching in
quote[grep_out]
#Note that grep() has also returned the position of 'they', as it contains 'the'. If we wanted to avoid this, you can use pattern = '^the$'

grep_out <- grep(pattern = '[A-Z]', x= quote)
grep_out
# we can search for the elements that contain a capital letter using the pattern '[A-Z]'
# to look at lower case use [a-z] instead 

# can use the ' .' function to identify whether there are two identified letter in the same word as shown below 
grep_out <-grep(pattern = 'i.e', x= quote)
quote[grep_out]
#using 'i.e' to find both i and e in a word in the quote variable which are seperated by atleast 1 other letter

#Quantifiers
#to specify how many of a character (or set of characters) grep() is matching to
#‘?’ denotes 0 or 1 instances.‘*’ denotes 0 or more instances.‘+’ denotes 1 or more instances.
quote[grep(pattern = 'e.?e', x= quote)]
quote[grep(pattern = 'e.*e', x= quote)]

#gsub() function
# to search for text in the same way as the 'grep()' function, but instead of finding the instances of our search term, it instead substitutes the matched text with text of our choosing
gsub_out <- gsub(pattern = 'a.e' , x= quote, replacement = '!!!')

gsub_out
#the letters mentioned by pattern have now been replaced with !!! symbols indicating this is where they are
gsub_out <- gsub(pattern = 't', x= quote, replacement = '???')
gsub_out
# replaced all the letter 't' with ?

#CHALLENGE
#1)  Load in the ‘dung_beetles_v2.csv’ into R ✅
df<- read.csv('dung_beetles_v2.csv')
print(df)
View(df)

#2) What sort of dataset do you think this is? ✔️
str(df)
# the data is in the form of all integers and is a community data set, Each row is a sample, with a count of each species in each column

#3) Make a new object that is a vector of all the species names.
sp_names<-colnames(df[3:68], do.NULL = TRUE, prefix = "col")
sp_names

#4)Use your new found grep() prowess to find the names of all the species that have a genus name that starts with the letter ‘C’.
grep_out <-grep(pattern= 'C', x= sp_names)
grep_out

#5)Find all the species where the specific epithet (the second word) starts with the letter ‘r’.
grep_out <-grep(pattern= '_r', x= sp_names)
grep_out
sp_names[grep_out]

#6)There is a typo in the species names! Replace all the ‘Copis’ genus names with the correct ‘Copris’ spelling.
gsub_out <-gsub(pattern= 'Copis', x= sp_names, replacement= 'Copris')
gsub_out


#7)Another genus name has been misspelled - ‘Microcopis’ should be ‘Microcopris’. Fix this too.
gsub_out <-gsub(pattern= 'Microcopis', x= gsub_out, replacement = 'Microcopris')
gsub_out


#8)Now create a new gsub() command that replaces the one you used in question 5 and 6, so that it is flexible enough to fix both genus names in one go.
gsub_out <- gsub(pattern = 'opis', sp_names, replacement = 'opris')
gsub_out

#9)Replace the column names in your data set with your corrected ones.
colnames(df) <- c('Site', 'Month', gsub_out)
df
