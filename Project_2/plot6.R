vehicle.scc <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emissions.motor.la <- NEI %>% 
  subset(fips == "06037" & NEI$SCC %in% vehicle.scc$SCC) %>%
  merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))

emissions.motor.baltimore2 <- cbind(emissions.motor.baltimore, "City" = rep("Baltimore", 4))
emissions.motor.la2 <- cbind(emissions.motor.la, "City" = rep("LA", 4))

emissions.motor.comp <- rbind(emissions.motor.baltimore2, emissions.motor.la2)

emissions.motor.comp.plot <- ggplot(emissions.motor.comp, aes(year, Vehicle.Emissions.Type, col = City)) +
  geom_point(size = 4, 
             alpha = 1/3) +
  xlab("Year") +
  ylab("Total Emissions [Tons]") +
  ggtitle("Comparison of Total Annual Vehicle Emissions in Baltimore and Los Angeles")

emissions.motor.comp.plot

ggsave("Project_2/plot6.png", plot = emissions.motor.comp.plot)
