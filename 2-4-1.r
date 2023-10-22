# Load necessary packages
library(ape)
library(phangorn)

# Read in the nucleotide alignment
alignment <- read.phyDat("fereshteh_gisaid_output.fasta.raxml.reduced.phy", format = "phylip")

# Convert the alignment to a DNAbin object
alignment_bin <- as.DNAbin(alignment)

# Calculate pairwise distances between sequences
distances <- dist.dna(alignment_bin, model = "raw")

# Generate a tree topology based on pairwise distances
tree <- nj(distances)

# Optimize the phylogenetic tree topology using ML estimation
fit <- pml(tree, data = alignment, model = "GTR", optInv = TRUE, optGamma = TRUE, 
           optParams = TRUE, trace = 0)

# Save the optimized tree topology to a file
write.tree(fit$tree, "optimized_tree.nwk")
