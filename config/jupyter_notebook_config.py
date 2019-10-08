import os
from subprocess import check_call


def post_save(model, os_path, contents_manager):
    """post-save hook for converting notebooks to .html files."""
    if model["type"] != "notebook":
        return  # only do this for notebooks
    d, fname = os.path.split(os_path)
    check_call(["bash", "../scripts/notebook_to_report.sh", fname], cwd=d)


c.FileContentsManager.post_save_hook = post_save

c.NotebookApp.contents_manager_class = "jupytext.TextFileContentsManager"
c.NotebookApp.ip = "0.0.0.0"
c.NotebookApp.port = 8910
c.NotebookApp.allow_root = True
c.NotebookApp.no_browser = True
