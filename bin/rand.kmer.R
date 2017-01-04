# rand.kmer.R
#
# Generate a random k-mer
# given
#  K-length
#  ntComposition
#  N.kmer
#
# Also project it to other nt space
#  ry - purine/pyrimidine [ T --> C ] && [ G --> A ]
#  sw - strong/weak [ C --> G ] && [ A --> T ]
#
# Also sub-select the first 1/2 of kmer
# half - first half of the kmer

# CONTROL PANEL =====================================================

# Kmer size
  K = 20

# Number of K-mers to generate
  N.kmer = 10000
  
# nt Composition - Use Relative Integers
  
  # hg19 nt-composition
  # A: 0.2952697
  # T: 0.2956993
  # G: 0.2045754
  # C: 0.2044557

  cA = 3
  cT = 3
  cG = 2
  cC = 2
  
# Output File
  output.path = '10000.rand.20k.csv'
  
# K-mer Generation =================================================
  
# Define a nt-selection space
ntComposition = c(rep("A",cA),
                  rep("T",cT),
                  rep("G",cG),
                  rep("C",cC) )
  
# Generate N.kmer * k-mers
  KMER = as.character()

  for (Iterator in 1:N.kmer){
    KMER = rbind(KMER,
                 paste0( sample(ntComposition, size = K, replace = T), collapse = '') )
  }

# Parse it to a character vector; kmer    
KMER = data.frame(KMER, stringsAsFactors = F)
  colnames(KMER) = 'kmer'
  
# 1/2 Subset of K-mer ===============================================

  KMER$half = apply(as.data.frame(KMER$kmer), 1, substr, start = 1, stop = floor(K/2))

# Projection Space K-mer ============================================

# ry-space
  KMER$ry = apply(as.data.frame(KMER$kmer), 2, gsub, pattern = "T", replacement = "C")
    KMER$ry = apply(KMER$ry, 2, gsub, pattern = "G", replacement = "A")

# sw-space
  KMER$sw = apply(as.data.frame(KMER$kmer), 2, gsub, pattern = "C", replacement = "G")
    KMER$sw = apply(KMER$sw, 2, gsub, pattern = "A", replacement = "T")

    
# Write Output ======================================================

    write.table(x = KMER, file = output.path, quote = F,
                sep = '\t', row.names = F, col.names = F)
    