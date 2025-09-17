#!/bin/sh

dir=$(cd "$(dirname "$0")" && pwd)

# Download files
wget -O "/tmp/cn_ipv4.txt" https://raw.githubusercontent.com/gaoyifan/china-operator-ip/refs/heads/ip-lists/china.txt || exit 1
wget -O "/tmp/cn_ipv6.txt" https://raw.githubusercontent.com/gaoyifan/china-operator-ip/refs/heads/ip-lists/china6.txt || exit 1

# Process rule files
cp "/tmp/cn_ipv4.txt" "$dir/cn_ipv4.txt"
cp "/tmp/cn_ipv6.txt" "$dir/cn_ipv6.txt"

# readd cnip
$dir/cnip.sh
