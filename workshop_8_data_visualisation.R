# Visualising data using ggplot 
# installing required packages 
install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

# looking at the penguins dataframe.
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g))

# Mapping species to the aesthetic colour of geom_point.
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g, colour = species)) # each colour highlights different species.
# Q1: Does this cluster also correlate with the island the penguins are from? change the code above to check.

# changing the code to is island 
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g, colour = island))
# yes cluster does correlate when changing colour = species to colour= island 


# Add additional layers to our plot by specifying additional geoms.
ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_smooth(mapping = aes(x = bill_length_mm, y = body_mass_g))

# improving the code so that we dont have to repeat mapping of variables --> pass to ggplot.
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth()

# data falls into 3 sp clusters, fitting curve across all is NOT good
# Mapping species again to colour 
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species)) +
  geom_smooth()
# curve still going across all 3 sp  as mapping only inherited by ggplot not btwn geomes.

# Copy and fix the code above, so that each species has its own fitted curve. 
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species)) +
  geom_smooth(mapping = aes(colour = species))


#  assign it to a variable and add other layers later. This way we can save a basic plot and try out different layers
pengu_plot <-
  ggplot(data = penguins,
         mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(aes(colour = species))

#We can add layers to our plot
pengu_plot +
  geom_smooth()

# Write code to produce the following plot. Hint: Look at the documentation for geom_smooth to find the arguments you need for a linear model and to remove the confidence intervals.
pengu_plot_2 <-
  ggplot(data = penguins,
         mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(colour = species))

pengu_plot +
  geom_smooth(mapping= aes(colour= species), method= 'lm', se= FALSE)
# changing x and y to bill length and bill depth to match the graph on the worksheet.
# using method= lm 'liner model' assigns to linear model, se= FALSE- ignore confidence intervals. 

# Saving plots 
ggsave(filename ="penguin_plot_1.png", plot = pengu_plot,
       width= 200, height= 300, units= "mm")

ggsave(filename ="penguin_plot_2.png", plot = pengu_plot,
       width= 200, height= 300, units= "mm")

# Continuous versus categorical variables 
 # mapping only caused for the line colour to change. 

# Change the code, so it fills the boxes with colour instead of the lines.
ggplot(data = penguins,
       mapping = aes(x = species, y = body_mass_g,)) +
  geom_boxplot(mapping = aes(colour = species, fill= species)) 

# looking at penguin dataframe
head(penguins)
str(penguins)
# can see which variables are factors using str() species and island = factor

df_days <-
  data.frame(day = c("Mon", "Tues", "Wed", "Thu"),
             counts = c(3, 8, 10, 5))
df_days$day <- as.factor(df_days$day)
str(df_days)

ggplot(data = df_days, mapping = aes(x = day, y = counts)) +
  geom_col()
# alphabetical order not correct in bar graph, instead defined by levels instead of days.

#fixing alphabetical order
df_days$day <- factor(df_days$day, levels = c("Mon", "Tues", "Wed", "Thu"))
str(df_days)

ggplot(data = df_days, mapping = aes(x = day, y = counts)) +
  geom_col()

# Reproducing a violin plot using the penguin dataframe. 
penguins$species <-factor (penguins$species,
                           levels= c("Chinstrap", "Gentoo", "Adelie")) # ordering sp in order shown on worksheet.
str(penguins$species)

ggplot(data = penguins,
       mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(mapping = aes(colour = island, fill= island)) # fill used to colour entire plot instead of outline.

# statistical transformation 
ggplot(data = penguins) +
  geom_bar(mapping = aes(x = species)) +
  coord_flip()
# Q: What is the difference between geom_bar() and geom_col()?
# geom_bar() presents the variables horizontally whilst geom_col presents variables vertically.
# coord_flip() converts display to x conditional on y.

# Plotting only subset of your data: filter()
penguins %>% filter(!species == "Chinstrap") %>% # excluding the species 
  ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species, shape = island))
# filter() is extremely useful together with the function is.na() to get rid of pesky NAs.

# Use is.na(sex) with filter() to reproduce the plot below, so that it only contains penguins where sex is known.
penguins$species2 <-factor (penguins$species,
                           levels= c("Adelie", "Chinstrap", "Gentoo")) # ordering according to plot on worksheet.


penguins %>% filter (!is.na(sex)) %>% # removing NA from the key of unspecified sexes of species.
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(mapping = aes(colour = sex, fill= sex)) # filtering based on sex of species.


# Labels
penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Gentoo penguins are the heaviest",
       x = "Species",
       y = "Weight in g",
       fill = "Sex",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  )
# mapped a categorical, i.e. discrete, variable (sex) to fill, so the function to use is scale_fill_discrete(). This function also allows you to change the colours

penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Gentoo penguins are the heaviest",
       x = "Species",
       y = "Weight in g",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  ) +
  scale_fill_discrete(name = "Sex", # the legend title can be changed here or in labs()
                      labels = c("Female", "Male", "Unknown"),
                      type = c("yellow3", "magenta4", "grey"))

# generate a new plot with at least two geoms, good labels, and maybe even try out some colours
