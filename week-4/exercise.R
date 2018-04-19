# Exercise 7: DPLYR practice with NBA data
# install.packages("dplyr")
library(dplyr)

# Read in the NBA team data of the 2016-2017 season from the data directory  
# into a variable called `team.data` using `read.csv`
team <- read.csv("data/teams.csv", header = TRUE)
is.data.frame(team)
# The data.frame team.data should now be accessible to you. 
# View it, and get some basic information about the number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" 
# following the names of teams that made it to the playoffs that year.
View(team)
nrow(team)
ncol(team)

# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team

team <- mutate(team, turnovers = TOV/STL)

# Sort the teams from lowest turnover/steal ratio to highest
team <- arrange(team, turnovers)

# Get the team that had the highest Total Rebounds (TRB) only with the columns 
# Team and TRB  *using one line of code*
sub_team <- select(filter(team, TRB == max(TRB)),Team,TRB)


# Print only the name of the team that had the highest total rebounds
# (that also happens to be the greatest team of all time)

print(sub_team$Team)

## Let's change gears!

# Read in the Pokemon data from the data directory  
# into a variable called `pokemon` using `read.csv`. Remember to not read strings in as factors.
po <- read.csv("data/pokemon.csv",stringsAsFactors = FALSE)
# First, View() the data set to see what info you have to work with 
is.data.frame(po)
View(po)
# Find all the Pokemon that are "Water" Type 1 (or your favorite)
# Save those rows into a variable called `water.pkm`
water.pkm <- po %>% filter(Type.1 == "Water")

# Group the pokemon by Type 2 and save into a descriptive variable
grouped.water.pkm <- water.pkm %>% group_by(Type.2)

# View your new variable -- did it affect anything?
View(grouped.water.pkm)
# No. They're grouped, but there is nothing to aggregate or summarize rows


# Use summarize() to figure out what the mean (average) speed is for 
# each different type in type 2 and what the maximum HP (health point) value is
# within each group.
generation <- grouped.water.pkm %>% summarize("Mean speed" = mean(Speed), "Max HP" = max(HP))
# New pokemon are released in generations. Aggregate the data on generations
# using summarize() to look at the minimum and maximum attack and defense values
# across generations for Pokemon that are not "Legendary". 
pokemon.new<- po %>% filter(Legendary == "False") %>% group_by(Generation) %>% summarize("Maximum attack" = max(Attack), "Minimum attack" = min(Attack), "Maximum defense" = max(Defense), "Minimum defense" = min(Defense))



# Can you do it in one line?
