set -e

input_file="$@"
base_file="${input_file%.*}"
ipynb_file=$base_file".ipynb"
html_file=$base_file".html"

cd ../reports
bash ../scripts/sync_notebook.sh $input_file
bash ../scripts/notebook_to_report.sh $ipynb_file
xdg-open $html_file || open $html_file
