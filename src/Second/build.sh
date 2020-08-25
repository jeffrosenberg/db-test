#! /usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_NAME="${1:-Second}"
BUILD_CONFIGURATION=${2:-"Debug"}
VERSION=${3:-"7.6.0"}
PROJECT_DIR="${4:-${SCRIPT_DIR}}"
PROJECT_FILE="${PROJECT_DIR}/${PROJECT_NAME}.csproj"
NUGET_SRC=${NUGET_SRC:-"${HOME}/.nuget/packages/"}

# Build and package the database project
dotnet pack ${PROJECT_FILE} /nowarn:SQL71502

# Check whether the package already exists and the local repo and delete if it does
target="${NUGET_SRC}/${PROJECT_NAME}/${version}" && \
  [[ -d ${target} ]] && \
  echo "Removing ${target} in local repository" && \
  rm -rf ${target}

# Push the package to the local repo
dotnet nuget push "${PROJECT_DIR}/bin/${BUILD_CONFIGURATION}/${PROJECT_NAME}.${VERSION}.nupkg" --source ${NUGET_SRC}