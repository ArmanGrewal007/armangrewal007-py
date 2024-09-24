# Steps for contribution

1. Update `src/armangrewal007/cli.py`
2. Remove old dist files `rm -rf dist/*`
3. Build the package `python -m build`
4. Raise a PR
5. I will upload the package to PyPI using twine and my API key `twine upload dist/*`

## Notes for me

1. Run `pip install -e .` in local to install the module in editable mode, so that when you make changes in the `cli.py` file, you don't need to build the pacakge again, and just run `armangrewal007` to see the changes.
