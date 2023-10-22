# Load necessary packages
library(ape)
library(phangorn)

# Read in the nucleotide alignment
alignment <- read.phyDat("fereshteh_gisaid_output.fasta.raxml.reduced.phy", format = "phylip")

# Estimate the best-fitting nucleotide substitution model
model <- modelTest(alignment)

# Convert the alignment to a DNAbin object
alignment_bin <- as.DNAbin(alignment)

# Generate a tree object based on the optimized tree topology and branch lengths
tree <- read.tree("optimized_tree_branch.nwk")

# Optimize the nucleotide substitution model parameters using ML estimation
fit <- pml(tree, data = alignment, model = model, optInv = TRUE, optGamma = TRUE, 
           optParams = TRUE, trace = 0)

# Save the optimized tree topology, branch lengths, and nucleotide substitution model parameters to a file
write.tree(fit$tree, "optimized_tree_model.nwk")