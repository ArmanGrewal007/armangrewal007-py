# Steps for contribution

1. Update `src/armangrewal007/cli.py`
2. Remove old dist files `rm -rf dist/*`
3. Build the package `python -m build`
4. Raise a PR
5. I will upload the package to PyPI using twine and my API key `twine upload dist/*`

## Steps to push to homebrew
6. ... TODO: run some actions in homebrew-armangrewal007

## Steps to push to winget
7. ... TODO: create a .exe and push to some registry (try github releases)

## Notes for me

1. Run `pip install -e .` in local to install the module in editable mode, so that when you make changes in the `cli.py` file, you don't need to build the pacakge again, and just run `armangrewal007` to see the changes.
2. Command to create new gif `ffmpeg -i armangrewal007-py-v0.1.3.mov -vf "fps=30,scale=1920:-1:flags=lanczos" -y armangrewal007-py-v0.1.3.gif`
