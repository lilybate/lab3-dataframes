### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out

hawksPoints <- c(17, 7, 23, 48, 32)

## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name

opponentPoints <- c(16, 27, 27, 45, 39)

## Combine your two vectors into a dataframe

hawksGames <- data.frame(hawksPoints, opponentPoints)
hawksGames

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)

hawksGames$diff <- hawksPoints-opponentPoints
hawksGames

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them

hawksGames$won <- hawksPoints > opponentPoints
hawksGames

## Create a vector of the opponents name (such as "Denver Broncos")

opponentsName <- c("Broncos", "49ers", "Falcons", "Lions", "Saints")

## Add the vector of opponents into the data frame

hawksGames$opponentName <- opponentsName
hawksGames

## Compute the average score of Seahawks

mean(hawksGames$hawksPoints)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)

ncol(hawksGames[hawksGames$won == TRUE])

## What was the largest difference in scores (in favor of Seahawks)? (only pos scores?)

hawksGames$diff[hawksGames$diff == max(hawksGames$diff)]


## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`

length(opponentsName)

## Print the variable names in your data frame

colnames(hawksGames)

## Write a loop over all variables in your data frame
## print the variable name inside the loop

for(i in 1:ncol(hawksGames)){
  cat("The variable name is", colnames(hawksGames)[i], "at column number", i, "\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'

for(i in 1:ncol(hawksGames)){
  cat("The variable name is", colnames(hawksGames)[i], "at column number", i, "\n")
  if(is.numeric(hawksGames[[i]])){
    print("TRUE")
  }else{
    print("FALSE")
  }
}


## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric

for(i in 1:ncol(hawksGames)){
  cat("The variable name is", colnames(hawksGames)[i], "at column number", i, "\n")
  if(is.numeric(hawksGames[[i]])){
    avg <- mean(hawksGames[[i]])
    print(avg)
  }else{
    print("no average")
  }
}

##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`

library(stringr)

employees <- c(str_c("Employee", 1:100))

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120

salaries2021 <- c(runif(100,60,120))


## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.

salaries2022 <- c(runif(100,70,140))


## Create a data.frame 'salaries' by combining the vectors you just made

salaries <- data.frame(employees,salaries2021,salaries2022)


## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022

salaries$raise <- salaries2022 - salaries2021

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2015 salary of employee 57

pay57<- salaries$salaries2021[57]
pay57


## Now round the answer down to two digits after comma
## check out 'round()' function

round(pay57, 2)

## How many employees got a raise?

nrow(salaries[salaries$raise > 0, ])

## What was the value of the highest raise?
## Round the number to two digits!

biggestRaise <- salaries$raise[salaries$raise == max(salaries$raise)]
round(biggestRaise, 2)

## What was the name of the employee who recieved the highest raise?

salaries[salaries$raise == biggestRaise,]


## What was the average salary increase?
## Round the number!

round(mean(salaries$raise), 2)

## For people who did not get a raise, how much money did they lose?
## Round the number!

round(mean(salaries$raise[salaries$raise < 0]) , 2) 

