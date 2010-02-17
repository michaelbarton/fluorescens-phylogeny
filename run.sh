#! /bin/sh

if [ -d tmp ]; then
  rm -rf tmp
fi

mkdir tmp
cd ./tmp/
  cat ../src_data/rRNA/*.fasta > rRNA.fasta
  cp ../src_data/alignment/green_genes.align .
  mothur "#align.seqs(candidate=rRNA.fasta, template=green_genes.align)"
  mothur "#filter.seqs(fasta=rRNA.align,vertical=T)"
cd ..

if [ -d alignment ]; then
  rm -rf alignment
fi
mkdir alignment

cd ./alignment/
  cp ../tmp/rRNA.filter.fasta rRNA.align
  java -jar ../lib/readseq.jar -f Phylip -o rRNA.phylip rRNA.align
cd ..

rm -rf tmp
