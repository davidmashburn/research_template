set -e

input_file="$@"
base_file="${input_file%.*}"
ipynb_file=$base_file".ipynb"

if [ -f "$ipynb_file" ]
then
    echo "sync $ipynb_file with $input_file"
    jupytext --set-formats ipynb,py:percent $ipynb_file
else
    if [ -f "$input_file" ]
    then
        echo "create $ipynb_file from $input_file"
        jupytext --set-formats ipynb,py:percent $input_file
    else
        echo "input file not found: $input_file"
        exit
    fi
fi

echo "Set kernel"
jupytext --set-kernel - $input_file

echo "Sync notebook with py file and run black"

{
    jupytext --sync --pipe black $ipynb_file
} || {
    echo "Notebook not executed, execute \"$ipynb_file\"";
    jupytext --to notebook --execute $ipynb_file;
    jupytext --sync --pipe black $ipynb_file;
}