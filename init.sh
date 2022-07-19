#!/bin/bash
set -e

INSTANCE_NAME=$1
INSTANCE_MAINTAINER=$2

usage() {
  echo "Usage: $0 \$INSTANCE_NAME \"\$INSTANCE_MAINTAINER\""
  exit 1
}

if ! test $INSTANCE_NAME || ! test "$INSTANCE_MAINTAINER"
then
  usage
fi  

echo "Replacing variables in template files..."
echo "$\{instanceName\}: ${INSTANCE_NAME}"
echo "$\{instanceMaintainer\}: ${INSTANCE_MAINTAINER}"
IFS=$'\n' # This makes the find method below allow space in file names
TEMPLATE_FILES=$(find templates -type f)
# Use intermediate backup files (`-i`) with a weird syntax due to lack of portable 'no backup' option. See https://stackoverflow.com/q/5694228/594053.
# Credit to https://github.com/openfisca/country-template/blob/master/bootstrap.sh
sed -i.template "s|\${instanceName}|$INSTANCE_NAME|g" $TEMPLATE_FILES
sed -i.template "s|\${instanceMaintainer}|$INSTANCE_MAINTAINER|g" $TEMPLATE_FILES
find . -name "*.template" -type f -delete

echo "Using templates"
shopt -s dotglob # If set, bash includes filenames beginning with a '.' in the results of pathname expansion.
mv templates/* .
rm -Rf templates

echo "🎉 You're all done, congratulations"
echo "Now, just commit the files in Git launching"
echo ""
echo "git add . && git commit -m \"Initiate instance\""
rm init.sh
