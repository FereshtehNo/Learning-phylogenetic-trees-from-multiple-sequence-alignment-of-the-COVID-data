# Read in the alignment data in FASTA format
alignment <- readLines("fereshteh_gisaid_output.fasta.raxml.reduced.phy")

# Remove the header lines
alignment <- alignment[-seq(1, length(alignment), 2)]

# Create an empty distance matrix
num_seqs <- length(alignment)
dist_matrix <- matrix(0, nrow = num_seqs, ncol = num_seqs)

# Define a function to compute the distance between two sequences
pairwise_distance <- function(seq1, seq2) {
  num_diffs <- sum(charToRaw(seq1) != charToRaw(seq2))
  return(num_diffs)
}

# Calculate the pairwise distance matrix
for (i in 1:(num_seqs - 1)) {
  for (j in (i + 1):num_seqs) {
    dist_matrix[i, j] <- pairwise_distance(alignment[i], alignment[j])
    dist_matrix[j, i] <- dist_matrix[i, j]
  }
}

# Save the pairwise distance matrix to a text file
write.table(dist_matrix, "pairwise_distances.txt", sep = "\t", quote = FALSE, col.names = NA)