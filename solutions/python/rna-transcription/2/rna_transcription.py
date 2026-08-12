"""Convert DNA strand to RNA strand"""

DNA = 'GCTA'
RNA = 'CGAU'

def to_rna(dna_strand):
    """Take DNA strand and convert it to an RNA strand as a string"""
    rna_strand = []
    for char in dna_strand:
        rna_strand += RNA[DNA.index(char)]
    return str.join('',rna_strand)