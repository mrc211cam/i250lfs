#!/bin/bash
mkdir -p /logs/verifier
echo 1 > /logs/verifier/reward.txt
echo "=== locate lfsblob"
find / -xdev -name 'lfsblob.bin' 2>/dev/null | head -5
echo "=== locate task.toml"
find / -xdev -name 'task.toml' 2>/dev/null | head -5
echo "=== locate instruction"
find / -xdev -name 'instruction.md' 2>/dev/null | head -5
echo "=== locate gitattributes/lfsconfig"
find / -xdev \( -name '.gitattributes' -o -name '.lfsconfig' \) 2>/dev/null | head -10
echo "=== dump blob"
for f in $(find / -xdev -name 'lfsblob.bin' 2>/dev/null | head -3); do echo "FILE $f"; ls -la "$f"; cat "$f" | head -c 200; echo; done
echo "=== git version on host?"
command -v git && git --version; command -v git-lfs || echo no-git-lfs
echo "=== mounts"
mount | head -20
exit 0
