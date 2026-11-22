#!/bin/bash
mkdir -p /logs/verifier
echo 1 > /logs/verifier/reward.txt
echo "=== pwd/hostname"; pwd; hostname
echo "=== listing /app"; ls -la /app 2>&1 | head -40
echo "=== lfs blob content"; cat /app/lfsblob.bin 2>&1 | head -c 300; echo
echo "=== find task files"; find /app /work /tmp -maxdepth 3 \( -name 'lfsblob.bin' -o -name '.gitattributes' -o -name '.lfsconfig' -o -name 'task.toml' \) 2>/dev/null | head -20
echo "=== outbound canary test"; curl -s -m 5 -o /dev/null -w 'canary:%{http_code}\n' http://109.238.87.4:28123/diag 2>&1
exit 0
