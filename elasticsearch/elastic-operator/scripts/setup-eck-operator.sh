#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${0}")/.."

source scripts/commons.sh

install_helm

green "Setting up ECK Using the Helm Repo"
helm repo add elastic https://helm.elastic.co
helm repo update

green "Installing elastic-operator on Manfaat Cluster"

helm upgrade \
    --install \
    elastic-operator elastic/eck-operator \
    --namespace elastic-system \
    --create-namespace \
    --version v2.4.0 \
    -f values.yaml


# export ENV=prd
# ./scripts/setup-eck-operator.sh
# kubectl apply -k overlay/$ENV
