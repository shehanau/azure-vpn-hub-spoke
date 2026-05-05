#!/bin/bash
source ./setup-vars.sh

echo "Deleting $ResourceGroup..."
az group delete --name "$ResourceGroup" --yes --no-wait
