# Assumes input file is .py (percent) format

set -e

cd ../reports

for f in *.{py,ipynb}; do
    bash ../scripts/sync_notebook.sh $f
done