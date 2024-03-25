#!/bin/bash

# Extract the -S flag and remove it from the list of arguments to pass the remaining arguments to pip
SAVE_REQUIREMENT=false
for arg in "$@"; do
    shift
    if [ "$arg" = "-S" ]; then
        SAVE_REQUIREMENT=true
    else
        set -- "$@" "$arg"
    fi
done

# Call pip with the remaining arguments
pip "$@"

# If the -S flag was provided, add installed packages to requirements.txt
if $SAVE_REQUIREMENT; then
    if [ "$1" = "install" ]; then
        # Getting the list of installed packages with their versions
        for pkg in "${@:2}"; do
            if [[ "$pkg" != -* ]]; then
                pkg_version=$(pip freeze | grep -i "^$pkg==" | tail -n 1)
                if [ -z "$pkg_version" ]; then
                    echo "Warning: Unable to find version for package $pkg."
                else
                    # Check if entry already exists in requirements.txt
                    if grep -Fxq "$pkg_version" requirements.txt; then
                        echo "Dependency $pkg_version already exists in requirements.txt."
                    else
                        echo "$pkg_version" >> requirements.txt
                        echo "Added dependency $pkg_version to requirements.txt."
                    fi
                fi
            fi
        done
    else
        echo "The -S flag is supported only with the install command."
    fi
fi
