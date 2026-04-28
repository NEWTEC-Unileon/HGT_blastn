
#https://jokergoo.github.io/circlize_book/book/the-chorddiagram-function.html#reduce

library(circlize)

set.seed(999)
mat = matrix(sample(18, 18), 3, 6) 
rownames(mat) = paste0("S", 1:3)
colnames(mat) = paste0("E", 1:6)
mat

mat<-read.table("matrix_hgt.txt", sep="\t", header=TRUE,row.names=1)
mat<-as.matrix(mat)

# to sum the 2 sides of diagonal matrix and keep only one for plot
mat2a<-mat
for(i in 1:ncol(mat)) {
	for(j in 1:ncol(mat)) {
	mat2a[i,j]=mat[i,j]+mat[j,i]
	mat2a[j,i]=mat[i,j]+mat[j,i]
	}
}

mat2<-mat2a
for(i in 1:ncol(mat)) {
	mat2[i,i]=mat2a[i,i]/2
}
#write.table(mat,"matrix_hgt_order.txt",sep="\t")
# manually order genera on excel
#mat<-read.table("matrix_hgt_order.txt", sep="\t", header=TRUE,row.names=1)
#mat<-as.matrix(mat)
colnames(mat)<-rownames(mat)

df = data.frame(from = rep(rownames(mat), times = ncol(mat)),
    to = rep(colnames(mat), each = nrow(mat)),
    value = as.vector(mat),
    stringsAsFactors = FALSE)


cc_colors<-c(
"Lactococcus"="#B5BC4C",
"Tetragenococcus"="#C6AED5",
"Staphylococcus"="#A16DAD",
"Alkalibacterium"="#6B4F9E",
"Lactobacillus"="#4E78C4",
"Chryseobacterium"="#529BB5",
"Corynebacterium"="#64AE97",
"Acidipropionibacterium"="#92BC63",
"Acinetobacter"="#D0B541",
"Yaniella"="#E69036",
"Atopostipes"="#E1552A",
"Bifidobacterium"="#AF211D",
"Enterococcus"="#521A13",
"Brevibacterium"="#75B67F",
"Others"="#E8ECFB")




#pdf("plot_mat_sym_2b.pdf", height=20, width=20)
#chordDiagram(mat, symmetric=TRUE, grid.col=cc_colors)
#dev.off()

pdf("plot_long_2.pdf", height=16, width=16)
chordDiagram(mat, annotationTrack = "grid", preAllocateTracks = 1, grid.col = cc_colors, directional = 1,diffHeight = mm_h(1.5))
circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + 2.5, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
  circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.2, sector.index = sector.name, track.index = 2)
}, bg.border = NA)
dev.off()



mat<-read.table("surface_hgt.txt", header=TRUE,row.names=1)
mat<-as.matrix(mat)

mat2a<-mat
for(i in 1:ncol(mat)) {
	for(j in 1:ncol(mat)) {
	mat2a[i,j]=mat[i,j]+mat[j,i]
	mat2a[j,i]=mat[i,j]+mat[j,i]
	}
}

mat2<-mat2a
for(i in 1:ncol(mat)) {
	mat2[i,i]=mat2a[i,i]/2
}
#write.table(mat,"matrix_hgt_order.txt",sep="\t")
# manually order genera on excel
#mat<-read.table("matrix_hgt_order.txt", sep="\t", header=TRUE,row.names=1)
#mat<-as.matrix(mat)
mat<-mat2
colnames(mat)<-rownames(mat)

df = data.frame(from = rep(rownames(mat), times = ncol(mat)),
    to = rep(colnames(mat), each = nrow(mat)),
    value = as.vector(mat),
    stringsAsFactors = FALSE)

cc_colors <- cc_colors<-c("salmon4","skyblue3","skyblue4",
	"palegreen2","palegreen3","palegreen4",
	"wheat2",	#curd
	"snow3",
	"lightgoldenrod1","lightgoldenrod3","lightgoldenrod4",	#dairy	
	"plum",
	"salmon1","salmon3",	#cave
	"skyblue1")

pdf("plot_surf3.pdf", height=3, width=3)
chordDiagram(mat, symmetric=TRUE, grid.col=cc_colors,directional = 1, 
	 annotationTrack = "grid",
	 diffHeight = mm_h(1.5))
dev.off()

cc_colors <- cc_colors<-c("salmon4","skyblue3","skyblue4",
	"palegreen2","palegreen3","palegreen4",
	"wheat2",	#curd
	"grey","plum",
	"lightgoldenrod1","lightgoldenrod3","lightgoldenrod4",	#dairy	
	"snow3",
	"salmon1","salmon3",	#cave
	"skyblue1")

pdf("plot_surf2.pdf", height=20, width=20)
chordDiagram(mat, annotationTrack = "grid", preAllocateTracks = 1, grid.col = cc_colors)
circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + 2.5, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
  circos.axis(h = "top", labels.cex = 0.5, major.tick.percentage = 0.2, sector.index = sector.name, track.index = 2)
}, bg.border = NA)
dev.off()


cc_colors<-c("#FDB462","#B3DE69","#FCCDE5","plum","#CCEBC5")
pdf("plot_prod.pdf", height=3, width=3)
chordDiagram(mat, symmetric=TRUE, grid.col=cc_colors,directional = 1, 
	 annotationTrack = "grid",
	 diffHeight = mm_h(1.5))
dev.off()


cc_colors<-c("#80B1D3","#BC80BD","#FFED6F","plum","#D9D9D9")
pdf("plot_cave.pdf", height=3, width=3)
chordDiagram(mat, symmetric=TRUE, grid.col=cc_colors,directional = 1, 
	 annotationTrack = "grid",
	 diffHeight = mm_h(1.5))
dev.off()


