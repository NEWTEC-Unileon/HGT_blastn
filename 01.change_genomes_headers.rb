

name=''
out=File.new("all_genomes.fna","w")
`ls #{ARGV[0]} | sed "s/.fna//g" | sed "s/.fa//g" | sed "s/.fasta//g" > list.txt`
aa=File.open("list.txt").each_line do |file|
file.chomp!
#name=file.gsub("bins","mag")
name=file
puts name
	bb=File.open("#{ARGV[0]}/#{file}"*).each_line do |line|
	line.chomp!
#>contig00001 len=345504 cov=28.1 corr=0 origname=NODE_1_length_345504_cov_28.082128_pilon sw=shovill-spades/1.1.0 date=20210115
	if line =~ /^>/
		out.puts ">#{name}___#{line}"
	else
		out.puts line
	end
	end
	bb.close
end
aa.close
