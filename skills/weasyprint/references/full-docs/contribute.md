# Contribute

Source: https://doc.courtbouillon.org/weasyprint/stable/contribute.html

# Contribute

You want to add some code to WeasyPrint, launch its tests or improve its
documentation? Thank you very much! Here are some tips to help you play with
WeasyPrint in good conditions.

The first step is to clone the repository, create a virtual environment and
install WeasyPrint dependencies:

```
git clone https://github.com/Kozea/WeasyPrint.git
cd WeasyPrint
python -m venv venv
venv/bin/pip install -e '.[doc,test]'
```

You can then launch Python to test your changes:

```
venv/bin/python
```

Running WeasyPrint might look something like this:

```
venv/bin/python -m weasyprint example.html example.pdf
```

## Code & Issues

If you’ve found a bug in WeasyPrint, it’s time to report it, and to fix it if you
can!

You can report bugs and feature requests on [GitHub](https://github.com/Kozea/WeasyPrint). If you want to add or
fix some code, please fork the repository and create a pull request, we’ll be
happy to review your work.

You can find more information about the code architecture in the [Dive into the Source](going_further.md#dive-into-the-source) section.

## Tests

Tests are stored in the `tests` folder at the top of the repository. They use
the [pytest](https://docs.pytest.org/) library.

Tests require [Ghostscript](https://www.ghostscript.com/) to be installed and available on the local path. You
should also install all the [DejaVu fonts](https://dejavu-fonts.github.io/) if you’re on Linux.

You can launch tests using the following command:

```
venv/bin/python -m pytest
```

WeasyPrint also uses [ruff](https://docs.astral.sh/ruff/) to check the coding style:

```
venv/bin/python -m ruff check
```

## Documentation

Documentation is stored in the `docs` folder at the top of the repository. It
relies on the [Sphinx](https://www.sphinx-doc.org/) library.

You can build the documentation using the following command:

```
venv/bin/sphinx-build docs docs/_build
```

The documentation home page can now be found in the
`/path/to/weasyprint/docs/_build/index.html` file. You can open this file in a
browser to see the final rendering.
