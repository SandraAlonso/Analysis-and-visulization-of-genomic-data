# Analysis and visulization of genomic data
"Genomic Data Analysis and Visualization" and "Global Genomic and Single Cell Data" assignments from the Analysis and visulization of genomic data subject of the Computational Biology Masters Degree (UPM).

## Genomic Data Analysis and Visualization Assignment

### Description
A lab has identified an interesting effect in a hot spring located in Iceland:

Coinciding with the activity of a nearby volcano, the hot spring undergoes events of very high
temperature. You noticed that, after such episodes of high temperature (close to 90 degrees), a
bloom of algae living in the same environment happens.

Perform an in depth genomic and metagenomic exploration of this singular hot spring ecosystem, including 8 main work packages:

1. Metagenomic analysis
2. Genome analysis (basic checks)
3. Genome analysis (read mapping)
4. Genome analysis (variant calling)
5. Differential expression analysis
6. Functional analysis of the responsible genes
7. Phylogenetic analysis of the responsible genes
8. Conclusions

### Conclusions

My hypothesis for the effect observed in the hot spring after the high-temperature event is the
following one:

At the light of the metagenomics analysis results, we could observe how the diversity of the environment changes as temperature does. When temperature rises it increases survival opportunities
of Aquifex aeolicus which perfectly grows at high temperature and small oxygen concentrations.
This is why we found 84% of relative abundance. Thanks to the likely environment conditions and
to its chemoautotrophic metabolism, during high temperatures conditions it can easily fix nutrients. However, when temperature becomes lower, Aquifex aeolicus is no longer under its optimal
conditions for growth, and its abundance is highly reduced. Consequently, nutrients left behind
by Aquifex aeolicus could be used by other kinds of bacteria which prefer lower temperatures to
grow. In this sense the biodiversity of the ecosystem increases. A good example is Methanococcus
maripaludis which is the most abundant and has around 4% of relative abundance.

Continuing with the workflow and after getting familiar with the read characteristics, I made a
variant calling analysis from which I obtained a particular mutation with a relevant higher quality
than all others. This mutation was placed in the 1265109 position and corresponds to a NifA family
transcriptional regulator. This finding made me think that probably, as we are studying bacteria
which prefer growing in high temperatures, this mutation could be increasing the fixation rate or
turning this process more efficient in high temperatures environment.

The differential expression analysis showed that 5 genes were overexpressed (p-adj < 0.01) and 3 of
them were highly overexpressed in high temperatures environment. Finally, this analysis confirmed
that the most overexpressed in high temperatures was AQUIFEX_01423 gene which is in charge
of nitrogen fixation.

This research was later on confirmed by the phylogenetic analysis that showed that the closest
orthologs are ones with the same inferred function as our protein sequences. Most part of these
orthologs were from the Methanococcus maripaludis species (which was found in the initial samples
of normal and high temperature).

To sum up, the effect observed in the hot spring is caused by the nitrogen fixation efficiency of
this Aquifex aeolicus. When it finds optimal conditions (high temperature) it reaches the best
efficiency. Otherwise, when temperature gets a normal value and therefore is no longer an optimal
environment for Aquifex aeolicus, it stops growing and other bacteria take its place. However,
normal temperatures and nitrogen left by Aquifex aeolicus, which is one of the main mineral salts
needed by algae, creates a suitable environment for algae to grow.


## Global Genomic and Single Cell Data Assignment
### Description
1. Practice 1: PCA for studying genetic expression on cell lines.
2. Practice 2: PCA for detecting biomarkers on different cell lines.
3. Parctice 3: t-SNE for building transcriptome atlas map.

### Content
This folder contains 3 RScripts developed for answering the research question and a general and a report which includes the results of each practice.
