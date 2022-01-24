## ---
## title: "Practice 2"
## author: Sandra Alonso Paz
## ---
  
## Visualize distribution of gene expression values across samples. Use function boxplot (). File = TableS5.csv. What are the samples with more variability?
  
# ----------------------------------------------------------------------

# Uploading data
tablecsv <-read.csv("table_ex_2.csv",row.names=1)

# Print data characteristics
print("Column names")
colnames(tablecsv)  # Column names

print("Data size")
dim(tablecsv)       # Data size

print("Data saved as:")
class(tablecsv)     # Data class (data frame)

# Visualize distribution of gene expression values across samples
matrix<-as.matrix(tablecsv)
# For using boxplot function it is mandatory to create a matrix from the given data
boxplot(matrix, ylim = c(0,25000))

# ----------------------------------------------------------------------

## Analyze transcriptome differences for all cell types using PCA.

# ----------------------------------------------------------------------

# Perform a PCA with the given data and plot it
PCA<-princomp(tablecsv,cor=FALSE,scores=TRUE)
plot(PCA)

# Plot PCA loaings
plot(PCA$loadings, ylim = c(-1, 0.5))     
loadings = PCA$loadings
text(loadings,labels=row.names(loadings),pos=c(3,1,2,1,1,3,1,1,2,1,3,1,1,1))

# Plot Comp 1 vs Comp 2 --------------------------------------------------------
comp1_comp2 = data.frame(PC1=loadings[,1], PC2=loadings[,2]) # Create a data frame with loadings of Component 1 and 2
rownames(comp1_comp2) <-rownames(loadings)                   # Keep row names for labeling

# Plot and print results
plot(comp1_comp2$PC1, comp1_comp2$PC2, xlab = "Comp. 1", ylab = "Comp. 2", ylim=c(-1,0.5))
text(comp1_comp2,labels=row.names(comp1_comp2),pos=c(3,1,2,1,1,3,1,1,2,1,3,1,1,1))
print(comp1_comp2$PC1)

# Plot Comp 1 vs Comp 3 --------------------------------------------------------
comp1_comp3 = data.frame(PC1=loadings[,1], PC3=loadings[,3]) # Create a data frame with loadings of Component 1 and 3
rownames(comp1_comp3) <-rownames(loadings)                   # Keep row names for labeling

# Plot and print results
plot(comp1_comp3$PC1, comp1_comp3$PC3, xlab = "Comp. 1", ylab = "Comp. 3",  ylim=c(-1,0.5))
text(comp1_comp3,labels=row.names(comp1_comp3),pos=c(3,1,2,1,1,3,1,1,2,1,3,1,1,1))

# ----------------------------------------------------------------------

## Find biomarkers for Stem Cells as those genes only expressed in WOX5 domain(threshold for expression=1) and not expressed in rest of cell types.

# ----------------------------------------------------------------------

# First we need to know teh columns names
print(colnames(tablecsv))
# Chosen color palet
newcolors<-colorRampPalette(colors=c("gray48","springgreen3","yellow"))(256)

# Biomarkers only expressed in WOX5 domain
threshold_biomarkers<-subset(tablecsv, WOX5>1&APL<1&CO2<1&COBL9<1&COR<1&E30<1&GL2<1&PET111<1&S17<1&S18<1&S32<1&S4<1&SCR<1&WER<1&WOL<1)

# Plot result as heatmap
threshold_biomarkers_m<-as.matrix(threshold_biomarkers) # For creating a heat map it is mandatory to create first a matrix with the given data
heatmap(threshold_biomarkers_m, col = newcolors)

# ----------------------------------------------------------------------

## Separate now samples by performing PCA only in genes previously identified as StemCell Biomarkers (in step 3). Plot variance percentage for components, loadings andscores.

# ----------------------------------------------------------------------

# Perfom a PCA with the selected biomarkers and plot it
PCA2<-princomp(threshold_biomarkers,cor=FALSE,scores=TRUE)
plot(PCA2, main="Variance")

# ----------------------------------------------------------------------

# ----------------------------------------------------------------------

loadings = PCA2$loadings
scores = PCA2$scores

# Create a new data frame with loadings and scores of Component 1 and 2
df12 = data.frame(PC1=loadings[,1], PC2=loadings[,2])
df12_scores = data.frame(PC1=scores[,1], PC2=scores[,2])
# Keep the row names
rownames(df12) <-rownames(loadings)
rownames(df12_scores) <-rownames(scores)

# Create a new data frame with loadings and scores of Component 1 and 3
df13 = data.frame(PC1=loadings[,1], PC3=loadings[,3])
df13_scores = data.frame(PC3=scores[,1], PC4=scores[,3])
# Keep the row names
rownames(df13) <-rownames(loadings)
rownames(df13_scores) <-rownames(scores)

# Plot the loadings plot of each pair of components
plot(df12, xlim =c(-1.1,0.1), ylim = c(-0.2, 0.5),main= "PC1 vs. PC2")
text(df12,labels=row.names(df12),pos=c(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2))

plot(df13, xlim=c(-1.3,0.1), ylim=c(-0.6,0.55),main = "PC1 vs. PC3")
text(df13,labels=row.names(df13),pos=c(2,2,3,1,1,1,1,1,1,1,1,1,1,1))

# ----------------------------------------------------------------------

## Make a graph with multiple panels in which you plot variance percentagefor components, and scores in first 4 components

# ----------------------------------------------------------------------

# Perform a PCA with the given data and plot it
PCA<-princomp(tablecsv,cor=FALSE,scores=TRUE)
plot(PCA)

loadings = PCA$loadings
scores = PCA$scores

# Plot PCA loaings
plot(loadings, ylim = c(-1, 0.4))                                
text(loadings,labels=row.names(loadings),pos=c(3,1,2,1,1,3,1,1,2,1,3,1,1,1))

# Create a new data frame with loadings and scores of Component 1 and 2
df12 = data.frame(PC1=loadings[,1], PC2=loadings[,2])
df12s = data.frame(PC1=scores[,1], PC2=scores[,2])
rownames(df12) <-rownames(loadings)
rownames(df12s) <-rownames(scores)

# Create a new data frame with loadings and scores of Component 3 and 4
df34 = data.frame(PC3=loadings[,3], PC4=loadings[,4])
df34s = data.frame(PC3=scores[,3], PC4=scores[,4])
rownames(df34) <-rownames(loadings)
rownames(df34s) <-rownames(scores)

# Score plotting
plot(df12s)
plot(df34s)

# ----------------------------------------------------------------------


