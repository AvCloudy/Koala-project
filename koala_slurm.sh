#!/bin/bash -l
#Edit this script to suit your purposes
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G
#SBATCH --job-name=Koala_matheson_gold_coast
#SBATCH --time=100:00:00
#SBATCH --partition=general
#SBATCH --account=a_blah
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@server.com


# have to write simple job script to 1) extract tar.gz to $TMPDIR
# 2) run etandemquickrepeats through EMBOSS
# 3) to set variables for etandem to run through EMBOSS

# the email address is going to have to be editable
# so is the wall time. Can do simple experiments to estimate wall time for easy access, but have to
# solve so carney can do -- future problem. Will probably have to include script in snakelike, but 
# bunya login details already in same name...

module load anaconda3

source activate emboss

# need to decide on base directory cd/

for file in *; do
	if [-f "$file"]; then
		if [[ $file == *.tar.gz ]] then
			tar -xzf "$file" $TMPDIR/koala
		fi
		if [[$file == *.fasta then
			mv -n "$file" $TMPDIR/koala
		fi
	fi

cd $TMPDIR/koala

for file in *; do
	if [-f "$file"]; then
		equicktandem "$file" -minrepeat x -maxrepeat 600 -outfile $TMPDR/quickresults/"$file".etandem
# need a step here to get the appropriate min and maxrepeat to look for from equicktandem. also need
# to investigate getting the resuts from external sources - it looks like teagan simply does a lot 
# of this step in post
		etandem "$file" -minrepeat x -maxrepeat y -outfile $TMPDIR/koalaresults/"$file".etandem


#  From here, down, is what gets done in the running job ...
#  just like what you had in the body of your PBS Pro job scripts
#  e.g.
#  - Loading software modules,
#  - Setting environment variables,
#  - Organising data,
#  - Changing into working directories,
#  - Running executable programs
#  - Ensuring results are stored in a good place.

#  You will need to update your script if you have used PBS Pro environment variables.

#  To submit this batch job
#  Copy and paste this code block to a file
#  modify it as required.

#  Use the following to submit it
#  sbatch filename

#  Use the following to check its status
#  sstat jobID