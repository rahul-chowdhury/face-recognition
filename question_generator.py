from random import randrange
import sys
f1=open("question_bank","w")
number_of_questions=(int)(sys.argv[1])
for i in range(0,number_of_questions):
	f1.write((str)(i+1)+".question "+(str)(i+1)+"\n")
	f1.write("a)"+(str)(randrange(10000))+" b)"+(str)(randrange(10000))+" c)"+(str)(randrange(10000))+" d)"+(str)(randrange(10000))+"\n\n")
