# --------------------------------------------------------
# rm_folder
# --------------------------------------------------------
rm_folder() {
	echo "rm_folder " "$1"
	find -name "$1" -exec rm -rf {} \; | true
}

# --------------------------------------------------------
# delete site files
# --------------------------------------------------------
rm -f *.pem
rm -f *.csr
rm -f *.key
rm -f *.crt
rm -f .rnd

# --------------------------------------------------------
# remove rm_folder folder
# --------------------------------------------------------
rm_folder demoCA

# --------------------------------------------------------
# epilogue
# --------------------------------------------------------