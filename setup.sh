#!/usr/bin/env bash

[[ "$UID" != 0 ]] || [[ "$2" = -f ]] || {
    echo "You must *not* be root to run thsi script. Use '-f' as second argument to override"
    exit 1
}

sudo apt-get update && sudo apt-get instal pip3-venv

pyvenv "$1"

activation=(. venv/bin/activate)
"${activation[@]}"

pip3 install flask lxml

echo "You must now activate venv: \`${activation[*]}\`"
