f1=open("coloured_graph","r")
f2=open("students_present","r")
f3=open("individual_image_list","r")
colour_list=[]
student_list=[]
name_list=[]

colour_list=f1.read().split('\n')
colour_list.pop()
#print(colour_list)
for i in range(0,len(colour_list)):
	#print(i)
	colour_list[i]=(int)(colour_list[i])
for line in f2:
    student_list.append(map(int,line.split(' ')))

for line in f3:
    name_list.append(line.split(' '))
    
number_of_colours=1
for colour in colour_list:
	if(colour>number_of_colours):
		number_of_colours=colour

group=[[] for i in xrange(number_of_colours+1)] 
for i in range(1,number_of_colours+1):
	for colour in colour_list:	
		if(colour==i):
			group[i].append(student_list[colour_list.index(colour)-1][0]);
#print(group)
f3=open("groups","w")
for i in group:
	if(len(i)==0):
		continue
	else:
		for j in i:
			f3.write(name_list[j-1][1][0:name_list[j-1][1].index('\n')]+" ")
		f3.write("\n")
	
			
			
	
	
			
			
			
	
		
