#!/bin/sh

project_directory="$( cd "$( dirname "$0" )" && pwd )"
cd $project_directory

echo $project_directory

docker build \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg VERSION=`cat VERSION` \
	--tag drivve/svn-server \
	.
