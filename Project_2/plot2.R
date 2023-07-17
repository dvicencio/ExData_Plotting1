tot.emissions.baltimore <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  summarize(Total.Emissions.Baltimore = sum(Emissions, 
                                            na.rm = TRUE))
tot.emissions.baltimore


png("Project_2/plot2.png", width = 480, height = 480)


with(tot.emissions.baltimore, 
     plot(x = year, 
          y = Total.Emissions.Baltimore, 
          ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in Baltimore by Year",
          cex = 2,
          pch = 2,
          col = "red",
          lwd = 3))

dev.off()
