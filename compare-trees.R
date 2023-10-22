# Load necessary packages
library(ape)
library(phangorn)


# Read in the trees
tree1 <- read.tree("optimized_tree.nwk")
tree2 <- read.tree("optimized_tree_branch.nwk")
tree3 <- read.tree("optimized_tree_model.nwk")

# Calculate pairwise RF distances between all three trees
dist1 <- RF.dist(tree1, tree2)
dist2 <- RF.dist(tree1, tree3)
dist3 <- RF.dist(tree2, tree3)

# Print the pairwise distances
cat("RF distance between optimized_tree.nwk and optimized_tree_branch.nwk:", dist1, "\n")
cat("RF distance between optimized_tree.nwk and optimized_tree_model.nwk:", dist2, "\n")
cat("RF distance between optimized_tree_branch.nwk and optimized_tree_model.nwk:", dist3, "\n")
