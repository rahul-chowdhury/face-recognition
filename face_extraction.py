import cv2
#from scipy.cluster.vq import *
#from scipy.misc import imresize
from PIL import Image

import sys




f = open(sys.argv[2],"r")
li=[]
x=0
for line in f:
    li.append(map(int,line.split(' ')))
    x=x+1
print(len(li))
choice=sys.argv[2][0:5]
print choice
#name=raw_input("\nenter image name: ")
#choice=raw_input("\nenter 1 for test image and 2 for training image: ")

if choice == 'group':#it is taking first letters of group_faces_squares
   	f1=open("group.csv","w")
if choice == 'indiv':#it is taking first letters of individual_faces_squares
   	f1=open("individual.csv","a")
for i in range(0,x):   
   img = cv2.imread(sys.argv[1])
   k=li[0]
   #print(type(k[0]))
   crop_img=img[(li[i][1]):(li[i][1]+li[i][3]), (li[i][0]):(li[i][0]+li[i][2])] # Crop from x, y, w, h -> 100, 200, 300, 400
   # NOTE: its img[y: y + h, x: x + w] and *not* img[x: x + w, y: y + h]
   
   if(choice=='group'):
   	cv2.imwrite("./database/temp.jpg", crop_img)
   	src = Image.open("./database/temp.jpg")
   	output=src.resize((128,128))
  	output.save("./database/group"+str(i+1)+".jpg")
  	f1.write("./database/group"+str(i+1)+".jpg;0\n")
  	
   if(choice=='indiv'):
  	cv2.imwrite("./database/temp.jpg", crop_img)
   	src = Image.open("./database/temp.jpg")
   	output=src.resize((128,128)) 
  	output.save("./database/individual"+sys.argv[3]+".jpg")
  	f1.write("./database/individual"+sys.argv[3]+".jpg;"+sys.argv[3]+"\n")
  
  

   #cv2.waitKey(0)
   




