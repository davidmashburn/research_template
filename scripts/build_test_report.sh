set -e

test_report="LONG_NAME_NO_ONE_WILL_EVER_TYPE"

cd ../reports

rm -f $test_report*

echo '# %% [markdown]
# # Test Report
# %%
# %matplotlib inline

import matplotlib.pyplot as plt

# %%
plt.plot([1,2,4,3])

' > $test_report".py"

echo "build notebook, execute if needed"
bash ../scripts/sync_notebook.sh $test_report".py"

echo "build report"
bash ../scripts/notebook_to_report.sh $test_report".ipynb"

echo "build new py from notebook"
cp $test_report".ipynb" $test_report"_b.ipynb"
bash ../scripts/sync_notebook.sh $test_report"_b.py"
if [ -f $test_report"_b.py" ]
then
    jupytext --sync --pipe black $test_report"_b.ipynb"
else
    echo "failed to sync"
    exit
fi

echo "Test sync again for speed"
echo '
# %% [markdown]
# If this is in the report, sync update is working
# %%
print("This will not be in the report, because this requires re-running the notebook")
# To enable this, manually run the notebook in jupyter,")
# delete the notebook and rerun sync_notebook.sh, or run:")
# $ jupytext --to notebook --execute $test_report".ipynb";
# $ jupytext --sync --pipe black $test_report".ipynb";
' >> $test_report".py"

bash ../scripts/sync_notebook.sh $test_report".py"
echo "Re-build report with changes"
#jupytext --to notebook --execute $test_report".ipynb"  # manually re-run the notebook, leave commented
bash ../scripts/notebook_to_report.sh $test_report".ipynb"
