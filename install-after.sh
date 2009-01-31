#!/bin/sh
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash

        Cmd rm -rf $root/usr/share/doc/tig/
        Cmd rm -f $root/usr/share/doc/tig-*/*.[1-9].*
    fi
}

Main "$@"

# End of file
