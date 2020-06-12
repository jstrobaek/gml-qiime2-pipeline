#!/usr/bin/python3

__doc__ = "Convert a BIOM TSV holding taxon-counts categorized by treatment."

# IMPORT REQUIRED MODULES #####################################################
from pathlib import Path
import argparse
import csv
import re


# ARGUMENT PARSER #############################################################
prog_usage = '''
A highly specific program, that converts a BIOM TSV-file into Ivenn input
 format. Only intended for use with files originally output from QIIME 2,
 adhering to a specific formatting. For more detail,
 see: https://github.com/yogogoba/gml-qiime2-pipeline/blob/master/scr/README.md
             '''
parser = argparse.ArgumentParser(description=prog_usage)
parser.add_argument(
                    '-v',
                    '--version',
                    action='version',
                    version='%(prog)s 1.0'
                    )
parser.add_argument(
                    'infile',
                    metavar='FILE',
                    help='input BIOM TSV-file'
                    )
parser.add_argument(
                    '-o',
                    dest='outfile',
                    metavar='TEXT',
                    help='optional name for output file, defaults to ' +
                         'FILE-level-ivenn.txt'
                    )
parser.add_argument(
                    '-l',
                    dest='set_level',
                    metavar='INTEGER',
                    choices=[1, 2, 3, 4, 5, 6, 7],
                    default=6,
                    type=int,
                    help='set taxonomic level, defaults to 6 (genus)'
                    )
args = parser.parse_args()


# PATH & FILE DEFINING ########################################################
path = Path(args.infile).resolve().parent  # Set to input file directory.

outdir = Path(path)/"ivenn_input_files"
outdir.mkdir(parents=True, exist_ok=True)  # If the subdir does
                                           # not exit create it.


# MAIN CODE ###################################################################
# Convert level from integer to the corresponding character.
taxonomic_levels = {1:'k', 2:'p', 3:'c', 4:'o', 5:'f', 6:'g', 7:'s'}
level = taxonomic_levels[args.set_level]  # Defaults to 6 (genus).


# Assign output file name, and add extension (.txt chosen for compatibility).
if args.outfile:
    # If file name was specified by the user.
    outfile = str(outdir/args.outfile) + '-ivenn.txt'
else:
    # Build suffix string and base file name on input file name.
    suffix = '-l' + str(args.set_level) + '-ivenn.txt'
    outfile = str(outdir/Path(args.infile).stem) + suffix


# Initiate required variables.
all_taxa = []  # Holds the identified taxa.
treatment_taxa = []  # Builds the treatment specific output.
print_dict = {}  # Holds treatment associated taxa lists,
                 # to simplify the print process.


with open(args.infile, 'r') as input_file:
    # Initialize reader object.
    reader = csv.reader(input_file, delimiter='\t')
    # Iterate over readerObject.
    for row in reader:
        if row[0].startswith('# '):
            # Skip the document specification line.
            continue
        elif row[0] == '#OTU ID':
            # Stor column IDs (here ASV taxonomy) in list.
            all_taxa = row[1:]
        else:
            # Check each "cell" of the current row (treatment)
            # for presense (count > 0) of the column taxon.
            for col, count in enumerate(row):
                if col == 0:
                    # Assign row ID to variable, adding category
                    # separator specific to the Ivenn format.
                    treatment = count + ':'
                else:
                    if float(count) > 0:
                        # Make sure that the column taxon holds info-
                        # rmation at the targeted level.
                        taxon = re.findall((level + '__[A-Za-z]+'),
                                         ''.join(all_taxa[col-1].split(';'))
                                           )
                        if taxon:
                            # If a match was made, append the result
                            # to the taxa list.
                            treatment_taxa.append(''.join(taxon))
                    else:
                        continue
            # After the row has been checked, append the taxa list to
            # the dictionary, using treatment as key.
            print_dict[treatment] = treatment_taxa
            treatment_taxa = []  # Empty taxa list for next row.


# Print the dictionary in the required Ivenn format.
with open(outfile, 'w') as output_file:
    n_treatments = len(print_dict)  # Recorded to make sure that the
                                    # last line printed does not contain
                                    # a semi-colon character.
    for n, key in enumerate(print_dict):
        # Iterate over the keys of the dictionary, and print key-value
        # pairs to the output.
        if n + 1 == n_treatments:
            print(key, ','.join(set(print_dict[key])), sep='',
                  file=output_file)
        else:
            print(key, ','.join(set(print_dict[key])), sep='', end=';\n',
                  file=output_file)


# AUTHORSHIP INFORMATION ######################################################
__author__ = "Joel Ströbaek"
__copyright__ = "Copyright 2020, Joel Ströbaek"
__credits__ = ["Stephen Burleigh"]
__license__ = "GPLv3"
__version__ = "1.0"
__maintainer__ = "Joel Ströbaek"
__email__ = "joel.strobaek@gmail.com"
__status__ = "Prototype"
