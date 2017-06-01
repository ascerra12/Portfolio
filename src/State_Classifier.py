import csv

with open("Weka_cut.csv", 'r') as csvfile:
    
    readCSV = csv.reader(csvfile, delimiter=",")
    next(readCSV)
    children = []
    Income = []
    result = []
        
    for row in readCSV:
        
        kids = float(row[4])
        money = float(row[6])
       
        if kids > .008 and money > 100000:
                res = "Yes"
                result.append(res)
                row.append(res)
                
        else:
                        res = "No"
                        result.append(res)
                        row.append(res)
                        
        with open("output.csv","a") as f:
            print(row,file=f,)
            
        
        


