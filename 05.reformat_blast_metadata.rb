
hgenus={}
hfarm={}
hsist={}
hsource={}

#out=File.new("raw_hgt_table.txt","w")
#out.puts "Genus1\tGenus2\tlength\tsample1\tsample2\tintra-inter\tsist1\tsist2\tsource1\tsource2"

n=0
aa=File.open("metadata_613.csv").each_line do |line|
line.chomp!
#ID	Genus	species	farm	sist	sample	region
#Campylobacter_100	Campylobacter	C_coli	19	Intensive	Faeces	Murcia
if n==0
n+=1
else
cols=line.split("\t")
hgenus[cols[0]]=cols[3] # Taxonomy2
hfarm[cols[0]]=cols[12]	# Producer
hsist[cols[0]]=cols[14] # Cave
hsource[cols[0]]=cols[9] # Surface
end
end
aa.close



bb=File.open("blastn_999_nodupl.txt").each_line do |line|
line.chomp!
if line=~ /(\S+)\_NODE\S+\s+(\S+)\_NODE/
	if hfarm[$1]==hfarm[$2]
	#out.puts "#{hgenus[$1]}\t#{hgenus[$2]}\t#{line.split("\t")[3]}\t#{hfarm[$1]}\t#{hfarm[$2]}\tintra-farm\t#{hsist[$1]}\t#{hsist[$2]}\t#{hsource[$1]}\t#{hsource[$2]}"
	puts "#{hgenus[$1]}\t#{hgenus[$2]}\t#{line.split("\t")[3]}\t#{hfarm[$1]}\t#{hfarm[$2]}\tintra-farm\t#{hsist[$1]}\t#{hsist[$2]}\t#{hsource[$1]}\t#{hsource[$2]}\t#{line}"
	else
	#out.puts "#{hgenus[$1]}\t#{hgenus[$2]}\t#{line.split("\t")[3]}\t#{hfarm[$1]}\t#{hfarm[$2]}\tinter-farms\t#{hsist[$1]}\t#{hsist[$2]}\t#{hsource[$1]}\t#{hsource[$2]}"
	end
end
end
bb.close
