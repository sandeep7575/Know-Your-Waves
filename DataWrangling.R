library(readr)
Beach_Activity_Bridge <- read_excel("C:/Users/Dellpc/Desktop/IE/Dataset/Beach_Activity_Bridge.xlsx")
Activity <- read_csv("C:/Users/Dellpc/Desktop/IE/Dataset/Activity.csv")
Beach <- read_csv("C:/Users/Dellpc/Desktop/IE/Dataset/Beach.csv")
DF1<-merge(Beach_Activity_Bridge, Activity, by = "Activities")
colnames(Beach)[2] <- "Beach"
DF2<-merge(Beach, DF1, by = "Beach")
colnames(DF2)[2] <- "BeachId"
colnames(DF2)
#Creating a new Dataframe
DF3 <- data.frame(DF2$BeachId, DF2$Beach, DF2$ActivityId,DF2$Activities)
names(DF3) <- c("BeachId", "Beach", "ActivityId","Activities")
write.csv(DF3, file = "Beach_Activity.csv")
Warnings <- read_csv("Warnings.csv")
Beach_Warning <- read_csv("Beach_Warning.csv")
DF4<-merge(Beach_Warning, Beach, by = "Beach")
colnames(DF4)[3] <- "BeachId"
DF4<-merge(DF4, Warnings, by = "Warnings")
DF5 <- data.frame(DF4$BeachId, DF4$Beach, DF4$WarningId,DF4$Warnings)
names(DF5) <- c("BeachId", "Beach", "WarningId","Warnings")
write.csv(DF5, file = "Beach_Warning1.csv")
