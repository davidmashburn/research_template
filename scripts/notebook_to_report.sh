set -e

# defaults:
output_format="html"

output_options="--TemplateExporter.exclude_input_prompt=True
--TemplateExporter.exclude_markdown=False
--TemplateExporter.exclude_input=True
--TemplateExporter.exclude_output_prompt=True"

input_file="$@"
base_file="${input_file%.*}"
ipynb_file="$base_file.ipynb"

if [ -f "$input_file" ]
then
    if [ "$input_file" == "$ipynb_file" ]
    then
        echo "input file: $input_file"
    else
        echo "input file is not .ipynb: $input_file"
        exit
    fi
else
    echo "input file not found: $input_file"
    exit
fi

echo "create $output_format file"
jupyter nbconvert $output_options --to $output_format $ipynb_file
