

name=''
out=File.new("all_genomes.fna","w")

aa=File.open("list_genomes.txt").each_line do |file|
file.chomp!
name=file.gsub("bins","mag")
puts name
	bb=File.open("../MAGs_613/#{file}").each_line do |line|
	line.chomp!
#>contig00001 len=345504 cov=28.1 corr=0 origname=NODE_1_length_345504_cov_28.082128_pilon sw=shovill-spades/1.1.0 date=20210115
	if line =~ /^>.*(NODE\S+length\_\d+\_\S+)/
		out.puts ">#{name}_#{$1}"
	else
		out.puts line
	end
	end
	bb.close
end
aa.close
