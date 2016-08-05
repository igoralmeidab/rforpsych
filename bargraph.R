#This is the basic bar graph with error bars and significance symbols
# Quite useful to show differences in mean between groups
# these are made using the package "ggplot2"
require(ggplot2) # 

# first you need a data frame with at least three columns, "group", "mean" ,and "sd"
data<- data.frame("group"=c("A","B"),"mean"=c(20,25),"sd"=c(1,2))


#before start plotting with ggplot, keep in mind that this package plots graphs in layers
#this means that each part of the graph ( bars, error bars, significance symbols,etc) requires a line of code to be plotted
#also, R does not understand where things should be plotted, so you have to specify where each element should be plotted, as well as with which values


#Let's begin with a simple bar graph
ggplot(data,aes(x=group,y=mean))+ # graph itself
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")

#Adding error bars
ggplot(data,aes(x=group,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+
geom_errorbar(aes(x=group,ymin=mean-sd,ymax=mean+sd),position="dodge",width=0.25)
  
#Adding significance with *
  
ggplot(data,aes(x=group,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+
  geom_errorbar(aes(x=group,ymin=mean-sd,ymax=mean+sd),position="dodge",width=0.25)+
  annotate("text",x=1.5,y=28,label="**",size=11) # position, size and text


#Changing some aesthetics
ggplot(data,aes(x=group,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+
  geom_errorbar(aes(x=group,ymin=mean-sd,ymax=mean+sd),position="dodge",width=0.25)+
  annotate("text",x=1.5,y=28,label="**",size=11)+
  scale_fill_manual(values=c("darkred","navy"))+ # changing colours of the bars
  theme_bw()+ # one of the available background themes
  labs(title="Title of the Graph", x="Groups of this study",y="Variable")+ # labels of the title and both X and Y axis
  guides(fill="none") # No legends


#######################################################################
# a slightly more complex graph, with comparison of more variables between two groups
#for this we need a dataframe with groups, variables, mean, and sd

data1<- data.frame("group"=c("A","A","B","B"),
                   "variable"=c("var1","var2","var1","var2"),
                   "mean"=c(20,22,25,19),
                   "sd"=c(1,0.8,2,1.4)
                   )
# it is also needed a function called "position_dodge" so the error bars won't overlap
dodge <- position_dodge(width=0.9)

#graph
ggplot(data1,aes(x=variable,y=mean))+ # graph itself. Data is divided by variable
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+ # fill is used to separate the groups 
  geom_errorbar(aes(x=variable,ymin=mean-sd,ymax=mean+sd,fill=group),position=dodge,width=0.25)+
  annotate("text",x=1,y=28,label="***",size=11)+ 
  annotate("text",x=2,y=26,label="NS",size=5) #non significant


#including some aesthetics
ggplot(data1,aes(x=variable,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+ 
  geom_errorbar(aes(x=variable,ymin=mean-sd,ymax=mean+sd,fill=group),position=dodge,width=0.25)+
  annotate("text",x=1,y=28,label="***",size=11)+
  annotate("text",x=2,y=26,label="NS",size=5) +
  scale_fill_manual(values=c("darkred","navy"))+ # changing colours of the bars
  theme_bw()+ # one of the available background themes
  labs(title="Title of the Graph", x="Variables of this study",y="Mean") # labels of the title and both X and Y axis

########################################################################
#Some aesthetic variations

#1
ggplot(data1,aes(x=variable,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge",colour="black")+  #'colour="black"' creates a black border on the bars
  geom_errorbar(aes(x=variable,ymin=mean,ymax=mean+sd,fill=group),position=dodge,width=0.25)+ # changing 'ymin' to 'mean' makes the graph show only the upper part
  annotate("text",x=1,y=28,label="***",size=15, colour="blue")+ #bigger and different colour
  annotate("text",x=2,y=26,label="NS",size=3) + # smaller
  scale_fill_manual(values=c("grey50","black"))+ # changing colours of the bars
  theme_classic()+ # one of the available background themes
  labs(title="Title of the Graph", x="Variables of this study",y="Mean")

#2
ggplot(data1,aes(x=variable,y=mean))+ 
  geom_bar(aes(y=mean,fill=group),stat="identity",position="dodge")+ 
  geom_errorbar(aes(x=variable,ymin=mean-sd,ymax=mean+sd,fill=group),colour="tomato",position=dodge,width=0.25)+
  annotate("text",x=1,y=28,label="***",size=11,colour="#20B2AA")+
  annotate("text",x=2,y=26,label="NS",size=5,colour="#C0FF3E" ) +
  scale_fill_manual(values=c("#9999CC","#66CC99"))+ # changing colours of the bars
  theme_dark()+ # one of the available background themes
  labs(title="Title of the Graph", x="Variables of this study",y="Mean")
