# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.13.5
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% [markdown]
# # This is a sample report on simple_example

# %%
# %matplotlib inline

import matplotlib.pyplot as plt

import research_template

import os
import sys

examples_dir = os.path.join(os.path.dirname(os.path.abspath("")), "examples")

sys.path.append(examples_dir)

from simple_example import simple_example

print(f"research_template version {research_template.__version__}")

ex = simple_example(cache=True)

# %% [markdown]
# Plot of a

# %%
_ = plt.plot(ex["a"])

print("b is {}".format(ex["b"]))
