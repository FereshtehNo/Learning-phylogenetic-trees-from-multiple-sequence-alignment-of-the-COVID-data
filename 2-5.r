# Load the ape package
library(ape)
library(phangorn)


# Read in your alignment file
aln <- read.phyDat("fereshteh_gisaid_output.fasta.raxml.reduced.phy")

# Convert the alignment to a DNAbin object
dnabin_aln <- as.DNAbin(aln)

# Estimate the phylogenetic tree
tree <- nj(dist.dna(dnabin_aln))

# Set the number of bootstrap replicates
nboot <- 100

# Generate a set of bootstrap replicates and estimate the trees
boot_trees <- vector(mode = "list", length = nboot)
for (i in 1:nboot) {
  boot_dnabin_aln <- as.DNAbin(sample(aln, replace = TRUE))
  boot_trees[[i]] <- nj(dist.dna(boot_dnabin_aln))
}

# Save each bootstrap tree plot as a PNG file
for (i in 1:nboot) {
  # Set the filename for this bootstrap tree plot
  filename <- paste0("boot_tree_", i, ".png")
  
  # Open a new PNG device and plot the tree
  png(filename, width = 1500, height = 800, res = 100)
  plot(boot_trees[[i]], cex = 0.3)
  
  # Close the PNG device
  dev.off()
}
