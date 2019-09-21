import os

from simple_metrics_manager import NpzStorageInterface, ParameterizedDatedCacheManager

_data = os.path.expanduser("~/data/")
if not os.path.exists(_data):
    os.mkdir(_data)

STORAGE_DIR = os.path.expanduser("~/data/research_template/")
if not os.path.exists(STORAGE_DIR):
    os.mkdir(STORAGE_DIR)

CM = ParameterizedDatedCacheManager(NpzStorageInterface(STORAGE_DIR))
