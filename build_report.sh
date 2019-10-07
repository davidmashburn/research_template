set -e

input_file=$(basename "$@")
base_file="${input_file%.*}"
ipynb_file=$base_file".ipynb"
html_file=$base_file".html"

docker-compose run --rm research_template bash -c "cd /reports && bash /scripts/sync_notebook.sh $input_file && bash /scripts/notebook_to_report.sh $ipynb_file"

xdg-open ./reports/$html_file || open ./reports/$html_file
