# Load necessary packages
library(ape)
library(phangorn)

# Read in the optimized tree topology
tree_optimized <- read.tree("result.raxml-2.nwk")

# Prune the tree to remove some nodes or branches
tree_pruned <- drop.tip(tree_optimized, c("hCoV-19/Iran/NIC-A7/2021|EPI_ISL_8754024|2021-07-06:1e-08"))

# Collapse multifurcating nodes to simplify the tree
tree_simple <- multi2di(tree_pruned)

# Define a vector of colors for each group
group_colors <- c("red", "blue", "green")

# Assign a color to each tip label based on the group variable
group <- c("Group1", "Group2", "Group1", "Group3", "Group2", "Group3")
tip_colors <- group_colors[as.factor(group)]

# Plot the simplified tree with larger font size, longer branches, and colored tip labels
plot(tree_simple, cex = 0.3, edge.length = 10, tip.color = tip_colors)
