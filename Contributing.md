# Steps for contribution

1. Update `src/armangrewal007/cli.py`
2. Remove old dist files `rm -rf dist/*`
3. Build the package `python -m build`
4. Raise a PR
5. I will upload the package to PyPI using twine and my API key `twine upload dist/*`
