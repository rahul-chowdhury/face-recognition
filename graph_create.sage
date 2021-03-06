#from array import array
#from sage.graphs.graph_plot import GraphPlot
#from sage.graphs.base.c_graph import CGraph
#from sage.graphs.graph_plot import DEFAULT_PLOT_OPTIONS
#import sage.graphs.graph_plot


f1=open(".//nodelist","r")
f2=open(".//coloured_graph","r")



x=0
d={}
node_list=[]
for line in f1:
    node_list.append(map(int,line.split(' ')))
    x=x+1

node_color=[] #stores which node has what color
for line in f2:
    node_color.append(map(int,line.split(' ')))
color_list=[['',0],['#FF0000',0],['#FF9900',0],['#00FF00',0],['#0000FF',0]]
   

P =Graph(x)

#d = {'#FF0000':[0,5], '#FF9900':[1,6], '#FFFF00':[2,7], '#00FF00':[3,8], '#0000FF':[4,9]}
pos_dict = dict()
for i in range(0,x):
	pos_dict[i]=[node_list[i][4],500-node_list[i][5]]
	
for i in range(0,x):
	if(color_list[node_color[i][0]][1]==0):
		d[color_list[node_color[i][0]][0]]=[i]
		color_list[node_color[i][0]][1]+=1
	else:
		d[color_list[node_color[i][0]][0]].append(i)
		color_list[node_color[i][0]][1]+=1


pl = P.plot( vertex_size=500, pos=pos_dict ,vertex_colors=d ,color_by_label=True)
#pl.set_vertices(vertex_labels=True)
pl.plot()
#pl.show()
pl.save(".//seating_arrangement.png",aspect_ratio=1)







