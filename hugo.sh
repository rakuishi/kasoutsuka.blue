#!/bin/sh

set -e

DIR=$(cd $(dirname ${0}) && pwd)
cd ${DIR}

hugo_new() {
  SLUG=${1}
  FILENAME=$(date '+%F')-${SLUG}.md
  hugo new archives/${FILENAME}
  sed -i '' "s/slug: /slug: ${SLUG}/g" content/archives/${FILENAME}
  open content/archives/${FILENAME}
}

hugo_server() {
  open http://localhost:1313/
  hugo server --watch --buildDrafts
}

case $1 in
  'new')
    hugo_new $2
    ;;
  'server')
    hugo_server
    ;;
  *)
    echo "Usage: $0 <new|server>"
    exit 2
    ;;
esac
