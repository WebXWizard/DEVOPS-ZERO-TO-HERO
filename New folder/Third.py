#LISTS AND TUPLES:
Marks = [10, 20, 30, 40, 50]
print(len(Marks))
print(Marks)
print(Marks[3])
print(type(Marks))
print(Marks[0:3])
Students = ["zishan" , 23 , 45.7 , "Barabanki" ]
print(Students)
print(type(Students))
print(Students[0:3])
print(Students[2])
Students[2] = "Lucknow"
print(Students)
Students[0] ="Ansari"
print(Students) 
print(Students[0:3])
print(Students[2])
Students[3] = "Paris"
print(Students)
List = [2,6,4,3]
List.pop(2)
print(List)
# TUPLES
tup = ( 2,4,5,6)
print(type(tup))
print(tup[2])
print(tup[0])
Movies = []
mov1 = input("Fisrt movie:")
mov2 = input("Second movie:")
mov3 = input("Third movie:")
Movies.append(mov1)
Movies.append(mov2)
Movies.append(mov3)
print(Movies)
list1 = [1,2,4]
list2 = [1,2,3]
#Practice:
Copy1 = list1.copy()
Copy1.reverse()
if(Copy1 == list1): 
    print("list1 is palindrome")
else:
    print("list1 is not a palindrome")
print(Copy1)
list1.reverse()
print(list1)
Tup = ["C","D","A","A","B","B","A"]
print(Tup.count("B"))
Tup.count("A")
print(Tup)
Tup.sort()
print(Tup)