#!/bin/bash

echo "Downloading bin"

wget https://github.com/Kimu1109/vtools/releases/download/stable-1.0.0/vtools.tar.gz
mkdir bin
tar -zxvf vtools.tar.gz -C bin
rm vtools.tar.gz

BASE="$HOME/.local/bin"
TARGET="$BASE/vtools"

echo "Installing to $TARGET"

mkdir -p "$TARGET"

cp -r bin/* "$TARGET/"
chmod +x "$TARGET"/*
rm -r bin

PROFILE="$HOME/.bashrc"

if ! grep -q 'vtools' "$PROFILE" 2>/dev/null; then
cat >> "$PROFILE" << 'EOF'

# vtools
if [ -d "$HOME/.local/bin/vtools" ]; then
    export PATH="$HOME/.local/bin/vtools:$PATH"
fi
EOF
echo "PATH entry added to $PROFILE"
fi

echo "Done. Please relogin or run: source ~/.bashrc"