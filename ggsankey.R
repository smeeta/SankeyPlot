##*************************************************************
## Script Name - ggsankey
## Original from davidsjoberg git hub
## Link - https://www.youtube.com/watch?v=XRu_Nb8hfIA
## Customise the plot better 
##*************************************************************
## Install package from davidsjoberg git 
install.packages("remotes")
library("remotes")
remotes::install_github("davidsjoberg/ggsankey")
library(ggsankey)
library(ggplot2)
library(dplyr)

##--------------------------------------------------------------
# set seed 
set.seed(111)
# read in the my data 
tax1 <-read.csv("mydata.csv",head=TRUE)
head(tax1)
# make long 
df <- tax1 %>% make_long(Order,Family,Genus,Species)

# chart 3- node label at CENTRE 
p1 <- ggplot(df,aes(x=x,
                    next_x=next_x,
                    node=node,
                    next_node=next_node,
                    fill=factor(node),
                    label=node))
p1 <- p1+geom_sankey(flow.alpha=0.5,
                     node.color="black",
                     show.legend=FALSE)
p1 <-p1 + geom_sankey_label(size=4,color="black",fill="white")
p1 <-p1+theme_bw()
p1 <-p1 +theme(legend.position="none")
p1 <-p1 + theme(axis.title=element_blank()
                ,axis.text.y=element_blank()
                ,axis.ticks=element_blank(),
                panel.grid=element_blank())
# manual color of nodes 
p1 <- p1 + scale_fill_manual(values = c('Clostridiales'= 'orange',
                                        'Bacteroidales'= 'pink',
                                        'Candidatus_Borkfalkiales'='lightblue',
                                        'Lachnospiraceae'='green',
                                        'Christensenellaceae'='green',
                                        'Bacteroidales_unclassified'= 'green',
                                        'Lachnospiraceae_unclassified'='green',
                                        'Candidatus_Borkfalkiaceae'='green',
                                        'Anaerobutyricum'='green',
                                        'Christensenellaceae_unclassified' ='green',
                                        'Bacteroidales_unclassified'='green',
                                        'Candidatus_Borkfalkia'="green",
                                        'Intestinibacillus'='green',
                                        'Eisenbergiella'='green',
                                        'Eubacteriaceae'='green'
))
p1 <-p1 + labs(title="Taxonomy Control vs Test")
p1
#-----------------------------------------------------------------







