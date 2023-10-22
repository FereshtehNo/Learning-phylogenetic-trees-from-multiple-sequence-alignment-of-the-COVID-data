# Load necessary packages
library(ape)

# Read in the pairwise distance matrix
dist_matrix <- as.matrix(read.table("pairwise_distances.txt", header = FALSE, fill = TRUE))

# Perform the neighbor-joining algorithm
tree <- nj(dist_matrix)

# Save the tree topology to a file
write.tree(tree, "pairwise_distances.nwk")