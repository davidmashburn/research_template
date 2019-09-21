set -e

cd ../reports
bash ../scripts/sync_all_notebooks.sh

sleep 0.2

for f in *.ipynb; do
    echo "create html file"
    bash ../scripts/notebook_to_report.sh $f
done