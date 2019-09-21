set -e

cd ../reports
bash ../scripts/sync_notebook.sh "sample_report.py"
bash ../scripts/notebook_to_report.sh "sample_report.ipynb"
xdg-open "sample_report.html" || open "sample_report.html"