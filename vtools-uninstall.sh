#!/bin/bash
set -e

TARGET="$HOME/.local/bin/vtools"
PROFILE="$HOME/.profile"

echo "This will remove:"
echo "  $TARGET"
echo "  PATH entry from $PROFILE (if exists)"
echo

read -p "Continue? [y/N]: " ans
case "$ans" in
  y|Y) ;;
  *) echo "Canceled."; exit 0 ;;
esac

# 削除
if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
    echo "Removed: $TARGET"
else
    echo "Directory not found: $TARGET"
fi

# PATH 行削除
if [ -f "$PROFILE" ]; then
    TMP="$(mktemp)"

    awk '
    BEGIN{skip=0}
    /^# vtools$/ {skip=1; next}
    skip && /^fi$/ {skip=0; next}
    !skip {print}
    ' "$PROFILE" > "$TMP"

    mv "$TMP" "$PROFILE"
    echo "PATH entry removed from $PROFILE"
else
    echo "Profile not found: $PROFILE"
fi

echo
echo "Uninstall complete."
echo "Please restart your shell or run: source ~/.profile"
