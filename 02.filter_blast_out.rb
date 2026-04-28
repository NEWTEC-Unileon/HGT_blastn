

# We remove hits with the same genome (both same or different contig) and those with alignment lenght lower than 500 bp

#makeblastdb -in all_genomes.fna -dbtype nucl -out mags90
#blastn -db mags90 -query all_genomes.fna -out blastn_mags.txt -perc_identity 99.9 -outfmt 6 -num_threads 10

#out1=File.new("blastn_genomes_vs_genomes_filtered.txt","w")
out=File.new("blastn_999_filtered.txt","w")


aa=File.open("blastn_mags.txt").each_line do |line|
line.chomp!
#Ecoli_153_NODE_3_length_299180_cov_19.295838	Ecoli_214_NODE_6_length_181195_cov_28.064184	100.000	41	0	0	152369	152409	55123	55083	3.30e-09	76.8
if line =~ /^(\S+)\_NODE\S+\s+(\S+)\_NODE\S+\s+/
	if $1!=$2 and line.split("\t")[3].to_i>500
	out.puts line
	end
end
end
aa.close


