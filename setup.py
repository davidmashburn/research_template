from distutils.core import setup

# Read the version number
with open("research_template/_version.py") as f:
    exec(f.read())

setup(
    name="research_template",
    version=__version__,  # use the same version that's in _version.py
    author="David N. Mashburn",
    author_email="david.n.mashburn@gmail.com",
    packages=["research_template"],
    scripts=[],
    url="http://github.com/davidmashburn/research_template",
    license="LICENSE.txt",
    description="Template for a research package",
    long_description=open("README.md").read(),
    install_requires=[
        "numpy>=1.15",
        "matplotlib >= 2.1",
        "simple_metrics_manager >= 0.2.1.1",
    ],
)
