# Load necessary packages
library(phangorn)

# Read in the alignment data in PHYLIP format
alignment <- read.phyDat("fereshteh_gisaid_output.fasta.raxml.reduced.phy", format = "phylip")

# Estimate the optimal nucleotide substitution model using ML and AIC criterion
best_model <- modelTest(alignment, model = "K80")

# Print the estimated best-fit model
print(best_model$Substitution)