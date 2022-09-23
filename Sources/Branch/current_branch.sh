#!/bin/bash
#
# description:
#   Generating current git branch-name property in execution environment.
#
set -eo pipefail

BRANCH="master"
PROJECT_DIR=$1
DESTINATION=$2

if [ ! -z "${BITRISE_GIT_BRANCH+x}" ];then
    BRANCH=$BITRISE_GIT_BRANCH
elif [ ! -z "${CIRCLE_BRANCH+x}" ];then
    branch=$CIRCLE_BRANCH
else
    # if [ which git >/dev/null 2>&1 ];then
    BRANCH=$(git --git-dir=$PROJECT_DIR/.git rev-parse --abbrev-ref HEAD)
    # fi
fi

# Generate
cat << EOF > $DESTINATION
internal let _currentBranchName = "${BRANCH}"
EOF
