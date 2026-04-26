str1 = "I am Zishan Ansari.\nI am a best Free Fire player"
print(str1) 
srt2 = "Zishan"
str3 = "Ansari"
str4 =  srt2 +  str3
print(str4)
print(len(str4))
#INDEXING
A = "Zishan Ansari"
sh = A[11] 
print(sh)
B = A[0:5]
print(B)
x = "Apple"
print(x[-5:])
st = "I am studying Python from Apna College"
print(st.endswith("ege"))
D = st.replace("Python", "Zishan")   
print(D)
W = st.find("College")
print(W)
F = st.count("a")
print(F)
Name = str(input("Please enter your name:"))
print(len(Name))
str6 = "Hi, $ I am the $ dollar ex $45,$999"
name = input("say hi")
print(str6.count("$"))
Age = int(input("Please enter your age:"))
if(Age>=18):
    print("You can vote")
else:
    print("you cannot vote")  

# SECOND CONDITION  
Marks = int(input("Please enter your Marks:"))
if(Marks>80):
    print(" You can apply for addmission in IIT Colleges")
else:
    print("You can not apply for addmission in IIT Colleges")    
Light = input("Please enter the Coulor :")    
if(Light == "Red"):
    print("Stop")
elif(Light == "Green"):
    print("Go")     
elif(Light == "Yellow"):
    print("Wait")
else:
    print("Light is broken")
Marks = int(input(" Please enter the student marks:"))

if(Marks>=90):
    Grade = "A"
elif(Marks>=80 and Marks<90):
    Grade = "B"
elif(Marks>=70 and Marks<80):
    Grade = "C"
else:
    Grade = "D"
print(" Grade of the student is: ", Grade)   
Age = int(input("Enter your age:"))
if(Age>=18):
    if(Age>=80):
        print("You can not handle a car")
    else:
        print("you can drive a car in a city")
else:
    print(" You can not  abble to drive a car in city")    
Number = int(input("Please enter the number:"))
if(Number%2==0):
    print("Number is even")
else:
    print("Number is odd")
A = int(input("Please enter first number:"))
B = int(input("Please enter second number:"))
C = int(input("Please enter third number:"))
if(A>B and A>C):
    print("A si Greater number")
else:
    if(B>C):
        print("B is Greater number")    
Num = int(input(" Enter number:"))
if(Num%7==0):
    print("yes")
else:
    print("No")
A = int(input("X : "))
G = input("M/F : ") 
if(A == 3 and G == "M"):
    print("Fee is 200") 
elif((A == 3 or A ==5) and G == "F"):
    print("Fee is 250")
elif((A == 4 and A == 7) or G == "M"):
    print("Fee is 600")
else:
    print(" No Fee")             
Vechile = input("Enter your vechile Nmee:")
Drive = "yes" if Vechile is "car" else "no"
print("Drive =")   
# Single line if else Statement
Place = input(" Enter your favourite Place:")
print("I like Place") if Place =="America" or Place == "Lucknow" else print(" I don't like Place")
# ternary operator
Sal = float(input("Enter your salary:"))
Tax = Sal*(0.1,0.2) [Sal>50000]
print(Tax)
Radius = float(input("Enter the radius of Circle:"))
Area = 3.14 * Radius * Radius
print("Area of Circle is:", Area)
P = float(input("p ="))
R = float(input("r ="))
T = float(input("t ="))
SI = (P * R * T) / 100
print(SI)# I am Zishan Ansari
# i am a lazy person and also a stupid man.
# Practice Question
F = int(input("Enter first number:"))
S = int(input("Enter second number:"))  
sum = F + S
print(sum)
Side = int(input("Enter the side of square:"))
Area = Side * Side  
print(Area)
X = float(input("Enter first number:"))
Y = float(input("Enter second number:"))
print("Average is:", (X + Y) / 2)
A = int(input("Enter first number:"))
B = int(input("Enter second number:"))
if(A >= B):
    print("true")
else:
    print("false")
