Waesser <- seq(1, 134,by = 1)
mineraldaten <- select(Mineralwasser, Natrium,Kalium, Magnesium, Calcium, Mangan, 
                       Chlorid, Sulfat, Hydrogencarbonat, Nitrat, Nitrit, Fluorid)
matplot(Waesser, mineraldaten, type = "l",
        lty = 1, xlab = "Wassersorten", ylab = "Mineraliengehalt (mg)")
#Mineralwasser %>%
#  ggplot(aes(x = Wasser, y = Minearlien))+
# geom_bar()
#ggplot(data = mineraldaten, aes(x = Wasser, y = "Minearlien (mg)"), geom_smooth())