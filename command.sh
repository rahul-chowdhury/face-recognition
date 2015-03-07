pwd=${PWD}
python question_generator.py 50                                            #Question bank generator <-> 50 questions will be generated
rm -f individual.csv temp.sage
i=0
while read line; do
  myArray[$i]="$line"
  ((i++))
done < $1 #multiple group images for stitching
./stitching ${myArray[@]}                                                  #Panoramic stitching <-> panorama.jpg created
i=0
while read -a line; 
do
	((i++))
	echo -e "${line[0]}";
	./facedetect "${line[0]}"                                          #individual face detection <-> coordinates of faces stored in   		                                                                   #individual_faces_squares
	python face_extraction.py "${line[0]}" individual_faces_squares $i #faces extracted and resized (cropped faces)
done < $2 #or student_data
./facedetect -o "test.jpg" panorama.jpg                                    #group face detection <-> coordinates of faces stored in 
                                                                           #group_faces_squares
python face_extraction.py panorama.jpg group_faces_squares 0

i=0
rm -f students_present
while read line; do
  cp individual.csv temp.csv                    #individual.csv contains paths of faces cropped from individual student photographs
  echo "$line" >> temp.csv                      #temp.csv is a temporary file for matching a face from group photo with all the individual 
                                                          #photos and returning the best match
 ./facerec_demo temp.csv &> face_rec.txt        #face_rec.txt stores the match one at a time (predicted class/actual class) 
  x=$(awk '{print $4}' face_rec.txt)
  python find_centre.py $x $i                   #writes the matching class of the student along with its central coordinates in   
                                                #students_present
  ((i++))
  sed -n '$d' temp.csv
done < group.csv                                #group.csv contains paths of the faces cropped from panorama.jpg
python matrix_creation.py                       #creates an adjacency matrix
./graph_color                                   #stores the colours assigned to the nodes (students) in "coloured_graph"
python group_composition_generator.py           #assigns groups to students (output <-> stored in "groups" file)
python assignment_generator.py                  #creates a different assignment for each group
 
###To display the graph depicting the seating arrangement of students ==>> uncomment the next 8 commands
#cp graph_create.sage temp.sage
#s=$(grep "./" temp.sage)
#sed -i "s,./,${PWD},g" temp.sage 
#cd sage                              #go to the sage directory
#./sage <<EOF
#%runfile ${pwd}/temp.sage 
#EOF
