#Adam Scerra
#Code to read, cut and write full US Housing Unit Record dataset

setwd("C:/Users/Adam/Desktop/Hdata")
getwd()

dir()

#Information for file and allocating the file to an object
#this code is specifically for a call to ss15husa.csv 
#(1 of the 4 original data files) the letter was 
#changed from a to b to c to d to read in all of the data.
file.info("ss15husa.csv")$size/ 2^30

readLines('ss15husa.csv',n=3)

gymdata <- 'ss15husa.csv'

	index <- 0
	chunkSize <- 100000
#create connection object, opens file for reading
	con <- file(description = gymdata, open="r")

#create data object 
	
	dataChunk <- read.table(con,nrows=chunkSize, header=T, fill=T, sep=",")

	counter <- 0
	total_NOC <- 0 
	
	data12 <- data.frame()

	repeat{
		index <- index + 1
		options(scipen = 50)
		print(paste('Processing rows:', index * chunkSize))

		total_NOC <- total_NOC + sum(dataChunk$NOC)
		counter <- counter + nrow(dataChunk)

		if(index == 1){
			data1 <- dataChunk
		}
		if(index == 2){
			data2 <- dataChunk
		}
		if(index == 3){
			data3 <- dataChunk
		}
		if(index == 4){
			data4 <- dataChunk
		}
		if(index == 5){
			data5 <- dataChunk
		}
		if(index == 6){
			data6 <- dataChunk
		}
		if(index == 7){
			data7 <- dataChunk
		}
		if(index == 8){
			data8 <- dataChunk
		}
		if(index == 9){
			data9 <- dataChunk
		}
		if(index == 10){
			data10 <- dataChunk
		}
		if(index == 11){
			data11 <- dataChunk
		}
		if(index == 12){
			data12 <- dataChunk
		}	
		if(index == 13){
			data13 <- dataChunk
		}
		if(index == 14){
			data14 <- dataChunk
		}
		if(index == 15){
			data15 <- dataChunk
		}
		if(index == 16){
			data16 <- dataChunk
		}
		
		if(nrow(dataChunk) != chunkSize){
			print("processed all")
			break}

		dataChunk <- read.table(con,nrows=chunkSize, skip = 0, header=FALSE, 
						fill=T, sep=",")		
			
		if(index > 16) break
	}

close(con)
#creates a new object with only 4 specified columns for each data chunk that was read
data1 <- data1[c(7:8,49,64)]
data2 <- data2[c(7:8,49,64)]
data3 <- data3[c(7:8,49,64)]
data4 <- data4[c(7:8,49,64)]
data5 <- data5[c(7:8,49,64)]
data6 <- data6[c(7:8,49,64)]
data7 <- data7[c(7:8,49,64)]
data8 <- data8[c(7:8,49,64)]
data9 <- data9[c(7:8,49,64)]
data10 <- data10[c(7:8,49,64)]
data11 <- data11[c(7:8,49,64)]
data12 <- data12[c(7:8,49,64)]
data13 <- data13[c(7:8,49,64)]
data14 <- data14[c(7:8,49,64)]
data15 <- data15[c(7:8,49,64)]
data16 <- data16[c(7:8,49,64)]

names(data2) <- c("REGION","ST","FINCP","NOC")
names(data3) <- c("REGION","ST","FINCP","NOC")
names(data4) <- c("REGION","ST","FINCP","NOC")
names(data5) <- c("REGION","ST","FINCP","NOC")
names(data6) <- c("REGION","ST","FINCP","NOC")
names(data7) <- c("REGION","ST","FINCP","NOC")
names(data8) <- c("REGION","ST","FINCP","NOC")
names(data9) <- c("REGION","ST","FINCP","NOC")
names(data10) <- c("REGION","ST","FINCP","NOC")
names(data11) <- c("REGION","ST","FINCP","NOC")
names(data12) <- c("REGION","ST","FINCP","NOC")
names(data13) <- c("REGION","ST","FINCP","NOC")
names(data14) <- c("REGION","ST","FINCP","NOC")
names(data15) <- c("REGION","ST","FINCP","NOC")
names(data16) <- c("REGION","ST","FINCP","NOC")

#Binds together all seperate data chunks
big_data <- rbind(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,
			data12,data13,data14,data15,data16)
#outputs a new file named dataAhead.csv, this code was run 8 different times
#twice on each original file, to output 8 new files that together contained
#all of the rows but now each file only consisted of the 5 columns that we important.
	write.csv(big_data, file = 'dataA_Head.csv')	