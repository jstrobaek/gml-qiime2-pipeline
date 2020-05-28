# Includes commands used for installation of community plugins,
# available for QIIME 2-2020.2.


# DEICODE
#
# https://library.qiime2.org/plugins/deicode/19/
#
# Activate QIIME 2 environment.
cd ~/<path>/<to>/<wd>/
conda activate <q2_environment>

# Install plugin with Anaconda.
conda install -c conda-forge deicode

# Refresh the QIIME 2 plugin cache.
qiime dev refresh-cache

# Check that the plugin responds.
qiime deicode --help


# QURRO
#
# https://library.qiime2.org/plugins/qurro/22/
# https://github.com/biocore/qurro#installation-and-usage
#
# Activate QIIME 2 environment.
cd ~/<path>/<to>/<wd>/
conda activate <q2_environment>

# Install plugin with Anaconda.
conda install -c conda-forge qurro

# Refresh the QIIME 2 plugin cache.
qiime dev refresh-cache

# Check that the plugin responds.
qiime qurro --help
