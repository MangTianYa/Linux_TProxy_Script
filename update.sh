#!/bin/sh

dir=$(cd "$(dirname "$0")" && pwd)

# Download files
wget -O "/tmp/china.txt" https://raw.githubusercontent.com/gaoyifan/china-operator-ip/refs/heads/ip-lists/china.txt || exit 1
wget -O "/tmp/china6.txt" https://raw.githubusercontent.com/gaoyifan/china-operator-ip/refs/heads/ip-lists/china6.txt || exit 1

# Process rule files
cp "/tmp/china.txt" "$dir/china.txt"
cp "/tmp/china6.txt" "$dir/china6.txt"

# readd cnip
$dir/cnip.sh
