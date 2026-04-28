

# We remove hits with the same genome (both same or different contig) and those with alignment lenght lower than 500 bp

hgenus={}
hsample={}
#out1=File.new("blastn_genomes_vs_genomes_filtered.txt","w")
out=File.new("14.blastn_999_nodup_cleaned.txt","w")
out.puts "Tax1a	Tax1b	Spe1	Surf1	Prod1	Cave1	Tax2a	Tax2b	Spe2	Surf2	Prod2	Cave2	Mag1	Mag2	perc_identity	length	mistmaches	gaps	query_start	query_end	subject_start	subject_end	evalue	bitscore"


aa=File.open("metadata_613.csv").each_line do |line|
line.chomp!
cols=line.split("\t")
hgenus[cols[0]]=cols[3]
hsample[cols[0]]="#{cols[3]}\t#{cols[5]}\t#{cols[9]}\t#{cols[12]}\t#{cols[14]}"
end
aa.close


bb=File.open("13.blastn_999_nodupl.txt").each_line do |line|
line.chomp!
#Ecoli_153_NODE_3_length_299180_cov_19.295838	Ecoli_214_NODE_6_length_181195_cov_28.064184	100.000	41	0	0	152369	152409	55123	55083	3.30e-09	76.8
if line =~ /^(\S+)\_NODE\S+\s+(\S+)\_NODE\S+\s+/
puts $1
	if hgenus[$1]!=hgenus[$2]
	out.puts "#{hgenus[$1]}\t#{hsample[$1]}\t#{hgenus[$2]}\t#{hsample[$2]}\t#{line}"
	end
end
end
bb.close


