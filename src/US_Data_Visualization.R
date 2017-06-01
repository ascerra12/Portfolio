#Adam Scerra
#R code for statisical analysis

setwd("C:/Users/Adam/Desktop/Hdata")
getwd()

dataA_Head <- read.csv("dataA_Head.csv",stringsAsFactors = FALSE)
dataA_Tail <- read.csv("dataA_Tail.csv",stringsAsFactors = FALSE)
dataB_Head <- read.csv("dataB_Head.csv",stringsAsFactors = FALSE)
dataB_Tail <- read.csv("dataB_Tail.csv",stringsAsFactors = FALSE)
dataC_Head <- read.csv("dataC_Head.csv",stringsAsFactors = FALSE)
dataC_Tail <- read.csv("dataC_Tail.csv",stringsAsFactors = FALSE)
dataD_Head <- read.csv("dataD_Head.csv",stringsAsFactors = FALSE)
dataD_Tail <- read.csv("dataD_Tail.csv",stringsAsFactors = FALSE)

#head(dataA_Head)
#tail(dataA_Tail)
#head(dataB_Head)
#tail(dataB_Tail)
#head(dataC_Head)
#tail(dataC_Tail)
#head(dataD_Head)
#tail(dataD_Tail)

data <- rbind(dataA_Head, dataA_Tail,dataB_Head, dataB_Tail,
			dataC_Head, dataC_Tail,dataD_Head, dataD_Tail)

#head(data)
#tail(data)

#Creates objects of mean family income and total number of children excluding NA's.
	Mean_Fam_Income <- mean(data$FINCP, na.rm=TRUE)
	Total_NOC <- sum(data$NOC, na.rm=TRUE)

#Creates dataframe to calculate percentage of children in state and mean income per state.
	total_NOC <- aggregate(NOC~ST,data,sum)
		names(total_NOC)[2] <- "total_NOC"
	Mean_Fam_Income <- aggregate(FINCP~ST,data,mean)
		names(Mean_Fam_Income)[2] <- "Mean_Fam_Income"

total_NOC
max(total_NOC)

#population data from infoplease.com
population <- c(4858979,738432,6828065,2978204,39144818,5456574,3590886,945934,
			672228,20271272,10214860,1431603,1654930,12859995,6619680,
			3123899,2911641,4425092,4649676,1329328,6006401,6794422,9922576,
			5489594,2992333,6083672,1032949,1896190,2890845,1330608,8958013,
			2085109,19795791,10042802,756927,11613423,3911338,4028977,12802503,
			1056298,4896146,858469,6600299,27469114,2995919,626042,8382993,
			7170351,1844128,5771337,586107)

total_NOC$population <- population
total_NOC

total_NOC$percent_pop <- (total_NOC$total_NOC / population)

#State of highest percent of children 
	max(total_NOC$percent_pop)
	which.max(total_NOC$percent_pop)

#Average Mean income of country
	mean(data$FINCP,na.rm=T)

#Max mean income 
	max(Mean_Fam_Income)
		Mean_Fam_Income
#Corellation of Mean fam income and NOC per state
	cor(Mean_Fam_Income$Mean_Fam_Income,total_NOC$percent_pop)

#Creates dataframe of total NOC per state, and AVG Income per state.
	dataScerra <- c(total_NOC,Mean_Fam_Income)

#Plots relationship between total NOC per state, and AVG Income per state.	
	plot(percent_pop~Mean_Fam_Income,dataScerra, main="Avg State Income vs Percent
	 	of Children in State Population",ylab="Percent of Children in State",xlab=
		"Average Household Income")
	abline(Mean_Fam_Income$Mean_Fam_Income~total_NOC$percent_pop)	
	
	m <- lm(percent_pop~Mean_Fam_Income,dataScerra)
	m

#Creates histograms used for data visualization
	hist(total_NOC$percent_pop,main="Percent of Children in State Population",ylab=
		"Frequency",xlab="Percent of Children in Population")
	hist(dataScerra$Mean_Fam_Income,breaks = 25,main="Average Household Income Per 
		State",ylab="Frequency",xlab="Average Houshold Income (In Dollars)")

	
	



