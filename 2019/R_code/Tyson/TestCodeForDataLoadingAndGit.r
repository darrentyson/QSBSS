
# test code: loading data directly from GitHub and local data (within Git repo)

# the hash tag "#" at the beginning of a line indicates that R should ignore it as input
# This is used to annotate code in R

# references for data
# https://hemberg-lab.github.io/scRNA.seq.course/index.html
# https://doi.org/10.1038/srep39921

# remote data (on GutHub)
umi_counts <- read.table("https://github.com/hemberg-lab/scRNA.seq.course/blob/master/tung/molecules.txt?raw=true", sep = "\t")
read_counts <- read.table("https://github.com/hemberg-lab/scRNA.seq.course/blob/master/tung/reads.txt?raw=true", sep = "\t")

# column names are samples
# row names are genes

# calculate the total counts in each sample of umi and mapped reads
umi_sum <- apply(umi_counts,2,sum) #colum sum of reads
read_sum <- apply(read_counts,2,sum)

# generate a plot to visualize some of the data
plot(umi_sum, read_sum, main='GitHub data')


# now, pull data from local repository
# note: ".." represents going up one directory from the current working directory
# this code should work if the current working directory in R (or R-Studio) is the directory
# containing this file; check by typing "getwd()"

# the normalizePath() function should fix the path formatting for your computer
# WINDOWS users, especially: you should definitely learn this function since file paths 
# are often not generalized for different computers
# you can add this function into code as needed

uc <- read.table(normalizePath('../../Data/tung/molecules.txt'), sep='\t')
rc <- read.table(normalizePath('../../Data/tung/reads.txt'), sep='\t')

# generate an output file (this demonstrates you have been able to load both data sets)
write.csv(data.frame(pulled_all_data=all(umi_counts==uc)),file='MyDataLoadTest.csv',row.names=FALSE)
# Homework: 
# 1) make your own directory in the R_code folder (use your last name)
# 2) duplicate this file into your directory
# 3) execute the code and generate the test file that demonstrates you successfully loaded
#    all dta
# 4) commit your changes to the QSBSS GitHub repo

