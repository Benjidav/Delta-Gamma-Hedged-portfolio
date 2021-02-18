#Graphics
format = "%d/%m/%Y"

date = as.Date(date_serie, format)

ggplot(data =  as.data.frame(option_price_1),  aes(x = date, y = option_price_1)) + 
  geom_line(color = "steelblue") +
  labs(title = "K6 Option value over time",
       x = "Date",
       y = "Price") +
  scale_y_continuous(breaks = seq(0, 1.6, by = 0.2)) +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold")) +
  theme(axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold")) +
  theme(axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold"))

ggplot(data =  as.data.frame(option_price_2),  aes(x = date, y = option_price_2)) + 
  geom_line(color = "darkgreen") +
  labs(title = "K6.5 Option value over time",
       x = "Date",
       y = "Price") +
  scale_y_continuous(breaks = seq(0, 1.6, by = 0.2)) +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold")) +
  theme(axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold")) +
  theme(axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold"))

delta_gammahedge_1_graphe <- ggplot(as.data.frame(pf_DeltaGamma_Replication), aes(x = date)) + 
  geom_line(aes(y = pf_DeltaGamma_Replication, colour = "Delta-gamma hedged pf")) + 
  geom_line(aes(y = option_price_1, colour = "K6 Option"), alpha = 0.5) +
  scale_color_manual(name = "Legend", 
                     values = c("Delta-gamma hedged pf" = "red", "K6 Option" = "blue")) +
  scale_y_continuous(breaks = seq(0, 1.6, 0.2)) +
  labs(title = "Delta-gamma Hedge of the K6 Option with cte vol") + 
  xlab("") + ylab("Value") +
  theme(plot.title = element_text(hjust = 0.5, size = 15, face = "bold")) +
  theme(axis.title.x = element_text(hjust = 0.5, size = 12, face = "bold")) +
  theme(axis.title.y = element_text(hjust = 0.5, size = 12, face = "bold")) 
