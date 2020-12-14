Waesser <- seq(1, 134,by = 1)
matplot(Waesser, mineraldaten, type = "l",
        lty = 1, xlab = "Wassersorten", ylab = "Mineraliengehalt (mg)")
#Mineralwasser %>%
#  ggplot(aes(x = Wasser, y = Minearlien))+
# geom_bar()
#ggplot(data = mineraldaten, aes(x = Wasser, y = "Minearlien (mg)"), geom_smooth())