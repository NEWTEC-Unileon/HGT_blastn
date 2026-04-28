
data<-read.table("HGT_table_genera_pairs.txt", sep="\t", header=TRUE)

#write.table(table(round(data$length/1000), data$pair), "table_pair_length.txt", sep="\t", quote=FALSE)
#write.table(table(ceiling(data$length/1000), data$pair), "table_pair_length.txt", sep="\t", quote=FALSE)

library(tidyr)
library(ggplot2)

data<-read.table("table_pair_length.txt", sep="\t", header=TRUE, row.names=1)
#data<-as.data.frame(t(data))
data2<-data
data2$length<-rownames(data)

gathered<-as.data.frame(gather(data2, key="tax", value="Abundances",-c("length")))#, "Cave","Producer","Surface")))
levels(gathered$tax)<-factor(c(colnames(data)))
gathered$Abundances<-sqrt(gathered$Abundances)

cc_colors<-c("#B5BC4C","#C6AED5","#A16DAD","#6B4F9E","#4E78C4",
	"#529BB5","#64AE97","#92BC63","#D0B541","#E69036",
	"#E1552A","#AF211D","#521A13","#75B67F","#E8ECFB")

pdf("Fig_length.pdf",height=6, width=8)
ggplot(aes(y = Abundances, x = as.numeric(length)), data = gathered) +
 # scale_y_continuous(trans='sqrt') + 
   geom_bar(aes(fill = factor(tax, levels=levels(tax))),
   stat = "identity") +
#   stat = "summary", fun = "mean") +
   scale_x_continuous(breaks=c(0,10,20,30,40,50,60)) +
#   facet_grid(~Surface, scales = "free", space = "free") +
   labs(y= "sqrt(HGT counts)", x= "HGT size (Kbp)", fill = "Genera pair") + #fill makes reference to the legend
   theme_bw()+
   scale_fill_manual(values = cc_colors) +
   theme(#axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
        #axis.ticks.x=element_blank(),
	axis.text.x=element_text(angle=90),
	legend.position="right")
dev.off()

#gathered2<-aggregate(gathered,  group_by=c(), FUN=mean)
#gathered$Abundances<-gathered$Abundances/3


