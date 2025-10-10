# Licensed under the P-EADCA Universal Waiver License (PUWL v2.0draft02)
# See LICENSE.puwl in the project root for details.

# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import sys
from pathlib import Path

sys.path.insert(0, str(Path("../src").absolute()))

pkg_version: dict[str, str] = {}
exec(Path("../src/helloapp/_version.py").read_text(), pkg_version)

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "helloapp"
release = pkg_version["__version__"]
version = pkg_version["__version__"]

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",  # For generating documentation from docstrings
    "sphinx.ext.napoleon",  # For parsing Google and NumPy style docstrings
    "sphinx.ext.viewcode",  # To include links to source code
    "sphinx_autodoc_typehints",
    "sphinx.ext.intersphinx",
    "autoapi.extension",
]

intersphinx_mapping = {
    "flask": ("https://flask.palletsprojects.com/en/stable/", None),
}

napoleon_use_param = True
napoleon_use_rtype = True

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]
autodoc_default_options = {
    "members": True,
    "undoc-members": False,
    "show-inheritance": True,
    "exclude-members": "main",
    "member-order": "bysource",
}
autodoc_typehints = "both"
typehints_defaults = "comma"

# AutoAPI settings
autoapi_type = "python"
autoapi_dirs = ["../src/helloapp"]
autoapi_options = [
    "members",
    "undoc-members",
    "show-inheritance",
    "show-module-summary",
]

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "pydata_sphinx_theme"
html_context = {"default_mode": "auto"}
html_sidebars: dict = {"**": []}
html_theme_options = {"show_toc_level": 4, "secondary_sidebar_items": ["page-toc"]}
