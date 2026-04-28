

# We remove hits with the same genome (both same or different contig) and those with alignment lenght lower than 500 bp
hits=[]

out=File.new("blastn_999_nodupl_v2.txt","w")


aa=File.open("blastn_999_filtered.txt").each_line do |line|
line.chomp!
#Ecoli_153_NODE_3_length_299180_cov_19.295838	Ecoli_214_NODE_6_length_181195_cov_28.064184	100.000	41	0	0	152369	152409	55123	55083	3.30e-09	76.8
if line =~ /^(\S+\_NODE\S+)\s+(\S+\_NODE\S+)\s+/
	if hits.include?("#{$1}_link_#{$2}")==false and hits.include?("#{$2}_link_#{$1}")==false
	hits << "#{$1}_link_#{$2}"
	out.puts line
	elsif hits.include?("#{$1}_link_#{$2}")
	hits.delete("#{$1}_link_#{$2}")
	elsif hits.include?("#{$2}_link_#{$1}")
	hits.delete("#{$2}_link_#{$1}")
	end
end
end
aa.close
