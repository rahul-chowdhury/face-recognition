from __future__ import print_function
import sys

f1 = open("group_faces_squares","r")
f2 = open("students_present","a")
li = []
k=0
for line in f1:
    li.append(map(int,line.split(' ')))
    k=k+1

i=int(sys.argv[2])
x = li[i][0]+li[i][2]/2
y = li[i][1]-li[i][3]/2
print(""+str(sys.argv[1])+" "+str(x)+" "+str(y)+"", file=f2)
f2.close()    
