#! /usr/bin/bash

# Basic compilation script
# To be executed in the root of the package (source code) hierarchy
# Assumes a package structure with only two directory levels
# Compiled code is placed under ./build/
# Modify it if needed to suite your purpose

# Assume that the script is run in src/

javac -d build */*.java

cd build

# Start rmiregistry (port=1099) if not running yet
rmi_pid=$(lsof -i:1099 | grep rmi | awk 'NR==1 {print $2}')
if [ -z "$rmi_pid" ]
then
  $(rmiregistry) &
fi


# If you are using jar files, and these must be in some particular
#  place under the build tree, you should copy/move those jar files.
