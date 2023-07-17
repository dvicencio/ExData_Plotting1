library(ggplot2)
library(dplyr)


NEI <- readRDS(NEI_path)
SCC <- readRDS(SCC_path)

str(NEI)
head(NEI)

str(SCC)
head(SCC)

tot_emissions <- NEI %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = TRUE))

png("Project_2/plot1.png", width = 480, height = 480)


with(tot_emissions, # plot data 
      plot(x = year, 
           y = Total_Emissions, 
           ylab = "Total Annual Emissions [Tons]", 
           xlab = "Year",
           main = "Total Annual Emissions in the US by Year",
           cex = 2,
           pch = 2,
           col = "red",
           lwd = 3))

dev.off()
