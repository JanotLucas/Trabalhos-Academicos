# [ ] create, call and test the adding_report() function # then PASTE THIS CODE into edX def adding_report(report="T"): 
def adding_report() :
    total = 0     
    items = ""     
    report = ""     
    while True:         
        if report == "":             
            report = input("Choose Report Type (\"A\" or \"T\")\nReport Types include All Items (\"A\") or Total Only (\"T\"): ")         
        elif report == "A" :             
            var = input("Enter an integer or \"Q\": ")                
            if var.isdigit():                 
                total = total + int(var)                  
                items = items + "\n" + var             
            elif var.lower().startswith("q"):                 
                print()                 
                print("Items",items)                
                print()                 
                print("Total",total)                 
                break             
            else:                 
                print("Invalid input")                      
        elif report == "T":             
            var = input("Enter an integer or \"Q\": ")             
            if var.isdigit():                 
                total = total + int(var)            
            elif var.lower().startswith("q"):                 
                print()                 
                print("Total",total)                 
                break             
            else:                 
                print("Invalid input")                
        else:             
            print("Invalid input")             
            report = ""                                                                                                  
            adding_report()