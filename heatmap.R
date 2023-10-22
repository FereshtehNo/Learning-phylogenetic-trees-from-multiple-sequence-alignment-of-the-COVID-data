# Read in the pairwise distance matrix
dist_matrix <- as.matrix(read.table("pairwise_distances.txt"))

# Create a heatmap of the distance matrix
heatmap(dist_matrix, Rowv = NA, Colv = NA, col = rev(heat.colors(256)), 
        scale = "none", margins = c(10, 10))