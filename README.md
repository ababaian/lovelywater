# Serratus Project
./Serratus
An informatic analysis of the human genome

## Introduction
    In bioinformatics, nucleotide-sequencing information is usually represented using the characters {A, T, U, C, G, N} where 
    - A represents Adenine
    - T represents Thymine in DNA
    - U represents Uracil in RNA
    - C represents Cytosine
    - G represnts Guanine
    - N represents aNy nucleotide
    
    Additionally (IUPAC)[http://www.bioinformatics.org/sms/iupac.html] defines {R, Y, M, K, S, W, H, B, V, D, X} for all different combinations of {A, T, C, G}
    
    This project explores the relationship between {A, T, C, G} in the context of the human genome and in particular the information content of non-standard encodings for DNA, given a neccesarily non-random genome.
    
    This should be immediatly intuitive for geneticists. The 'Strong' nucleotides, guanine and cytosine which form three hydrogen bonds when base-paired are distinct from the 'Weak' nucleotides, adenine and thymine which form 2 hydrogen bonds when base-paired. Blocks of high GC-content or AT-content, called isochores, stain differently by Giemsa and segregate gene-rich and gene-depleted genomics regions.
    
    Further, the puRines, A and G, are synthesized by a distinct pathways from the pYrimidines, T and C. Purines and pyrimidines have distinct chemical structures and the mutation rate within the same class of nucleotide (transitions) is higher then a change in nucleotide class (transversions). This also means that given two homologous sequences in the genome, they will accumulate transition differences faster then they accumulate transversion differences.
    
    Finally, the IUPAC division of 'Amino' A and C and 'Keto' G and T division is based on a difference in chemical structure of the nucleotides. This is probably the least well-defined grouping of nucleotides compared to Strong-Weak and Purine-Pyrimdine axis.
    
## HYPOTHESIS
    
    * Non-standard encoding of genomic information better represents a genetic unit and it's relationship to homologous units across the genome
    
    * For a given K-mer, S, made up of X bits of information;
        Non-standard encoding of substrings of S, {s_1, s_2..., s_N} with <X bits, contain more information then the equivilent standard-encoded sub-string (with an equivalent amount of bits).
        Restated: there is 'mutual information' within a string of nucleotides which may be leveraged in computational algorithms