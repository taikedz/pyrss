#!/usr/bin/env bash

faile() {
    echo "$*"
    exit 1
}

[[ "$UID" != 0 ]] || [[ "$2" = -f ]] || faile "You must *not* be root to run thsi script. Use '-f' as second argument to override"

sudo apt-get update && sudo apt-get install python3-venv || faile "Could not install pre-req packages"

pyvenv "${1:-venv}" || faile "Could not run pyvenv"

activation=(. "${1:-venv}/bin/activate")
"${activation[@]}" || faile "Could not activate virtual environment"

pip3 install flask cssselect || faile "pip install failed"

echo "You must now activate venv: \`${activation[*]}\`"
