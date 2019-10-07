docker-compose run --rm --service-ports --name research_template_jupyter research_template bash -c " \
cd /reports && \
bash /scripts/sync_all_notebooks_no_execute.sh && \
jupyter notebook --config /config/jupyter_notebook_config.py \
"
