#!/usr/bin/env sh

set -ex

REF=${REF:?}
PROJ_DIR=$(dirname $(readlink -f $0))/../
PATCH_DIR=$PROJ_DIR/patches

cd "$PROJ_DIR"

cleanup() {
  rm -rf "$TEMP"
}

if [ ! -d "$KERNEL_DIR/.git" ]; then
  TEMP=$(mktemp -d .nolibc-sync-tmp.XXX)
  KERNEL_DIR="$TEMP/linux_source_code"
  git clone --depth 1 -b "$REF" https://github.com/torvalds/linux.git "$KERNEL_DIR"
else
  git -C "$KERNEL_DIR" remote set-url origin https://github.com/torvalds/linux.git
  git -C "$KERNEL_DIR" fetch --depth 1 origin "$REF"
  git -C "$KERNEL_DIR" checkout FETCH_HEAD
fi

git checkout -B "upstream/$REF"
rm -rf "$PROJ_DIR/include/nolibc/" "$PROJ_DIR/include/uapi/"
cp -r "$KERNEL_DIR/tools/include/nolibc/" "$KERNEL_DIR/include/uapi/" "$PROJ_DIR/include/"

REF_HASH=$(git -C "$KERNEL_DIR" rev-parse HEAD)
git add "$PROJ_DIR/include/nolibc/" "$PROJ_DIR/include/uapi/"
git commit -m "Sync nolibc from linux@$REF (commit $REF_HASH)"

for p in $PATCH_DIR/*.patch; do
  git am < "$p"
done

git checkout master
git merge "upstream/$REF"
git tag "$REF"
git push --tag origin master
