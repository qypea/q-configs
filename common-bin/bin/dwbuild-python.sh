#!/bin/sh

set -e
set -x

CODE="src tests examples setup.py"

python3 -m pycodestyle --ignore=E501,W503,W504 ${CODE}
python3 -m pydocstyle ${CODE}
python3 -m flake8 --ignore=E501,W503,W504 ${CODE}
python3 -m pylint --disable=r --output-format=parseable ${CODE}
python3 -m pylint --disable=all --enable=r --output-format=parseable ${CODE} || true
