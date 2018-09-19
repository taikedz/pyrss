#!/usr/bin/env bash

set -euo pipefail

faile() {
    echo "$*"
    exit 1
}

venvdir="${1:-venv}"

[[ "$UID" != 0 ]] || [[ "$2" = -f ]] || faile "You must *not* be root to run thsi script. Use '-f' as second argument to override"

sudo apt-get update && sudo apt-get install python3-venv || faile "Could not install pre-req packages"

[[ -f "$venvdir/bin/activate" ]] || {
    pyvenv "$venvdir" || faile "Could not run pyvenv to create '$venvdir' virtual environment"

    activation=(. "$venvdir/bin/activate")
    "${activation[@]}" || faile "Could not activate virtual environment"

    pip3 install flask cssselect || faile "pip install failed"
}

echo "You must now activate venv: \`${activation[*]}\`"
