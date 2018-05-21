#!/bin/bash
echo "crack open firewall..."
firewall-cmd --add-port=8888/tcp

echo "load up juypter lab"
#jupyter-lab --no-browser --allow-root --ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
jupyter-lab --no-browser --allow-root --ip=$(hostname -f)
