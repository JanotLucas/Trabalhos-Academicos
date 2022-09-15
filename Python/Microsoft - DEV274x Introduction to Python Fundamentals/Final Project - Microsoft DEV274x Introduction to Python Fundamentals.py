# [] create Element_Quiz # [] copy and paste in edX assignment page
def get_names():     
    count = 0     
    guess = []     
    while count <= 4:         
        element = input("Enter the name of an element: ")         
        if element.lower() in guess:             
            print(element, "was already entered")         
        else:             
            guess.append(element.lower())             
            count += 1     
    return guess 
# Program flow 
!curl https://raw.githubusercontent.com/MicrosoftLearning/intropython/master/elements1_20.txt -o elements1_20.txt 
elements1_20_text = open("elements1_20.txt","r") 
elements = [] 
elements1_20 = elements1_20_text.readline() 
while elements1_20:     
    elements.append(elements1_20.strip("\n"))     
    elements1_20 = elements1_20_text.readline() 
guess = get_names() 
correct = [] 
incorrect = [] 
for ltr in guess:
    if ltr.capitalize() in elements:
        correct.append(ltr.capitalize())    
    else:         
        incorrect.append(ltr.capitalize()) 
num_correct = len(correct) 
num_incorrect = len(incorrect)  
p_correct = (num_correct)*20  
print(p_correct,"% correct") 
print("Found",str(correct)) 
print("Not Found",str(incorrect)) 
elements1_20_text.close()