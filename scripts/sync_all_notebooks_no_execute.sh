# Assumes input file is .py (percent) format

set -e

cd ../reports

for f in *.{py,ipynb}; do
    bash ../scripts/sync_notebook_no_execute.sh $f
done