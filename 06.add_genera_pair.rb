
genera=[]
n=0
aa=File.open("HGT_table_cleaned.txt").each_line do |line|
line.chomp!
#Tax1	Spe1	Surf1	Prod1	Cave1	Tax2	Spe2	Surf2	Prod2	Cave2	Mag1	Mag2	perc_identity	length	mistmaches	gaps	query_start	query_end	subject_start	subject_end	evalue	bitscore
#Lactococcus	Lactococcus lactis	cheese_core_Stage_3	Producer_2	Cave_2	Tetragenococcus	Tetragenococcus koreensis	cheese_rind_Stage_3	Producer_2	Cave_1	mag_106_S13.20.fna_NODE_6609_length_1963_cov_173.056080
if n==0
n=1
else
cols=line.split("\t")
arr=[]
genera << cols[0]
genera << cols[5]
arr << cols[0]
arr << cols[5]
puts "#{arr.sort[0]}-#{arr.sort[1]}\t#{line}"
end
end
aa.close

=begin
hgen={}
genera=genera.uniq
genera.each_index{|a| hgen[genera[a]] = a}
matrix = Array.new(genera.length()) {|index| Array.new(genera.length()) {|x| 0}}	

aa=File.open("HGT_table_cleaned.txt").each_line do |line|
line.chomp!
if n==1
n=2
else
cols=line.split("\t")
matrix[hgen[cols[0]][hgen[cols[5]]]+=1
end
end
aa.close

salida = File.new("matrix_hgt.txt","w")	

mm=-1
genera.each {|i| salida.print "\t#{i}"}
salida.print "\n"
matrix.each {|i|  mm+=1
salida.print "#{genera[mm]}"
i.each {|value| salida.print "\t#{value}"}
salida.print "\n"
}

=end



