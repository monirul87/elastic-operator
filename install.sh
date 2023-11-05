#!/usr/bin/env bash

function install_helm() {
    if command_exists /usr/local/bin/helm; then
        echo "Helm is installed already"
    else
        local HELM_VERSION="v3.7.2"
        curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash -s -- --version "${HELM_VERSION}"
    fi
}

function install_operator() {
  helm repo add elastic https://helm.elastic.co
  helm repo update
  helm upgrade \
    --install \
    elastic-operator elastic/eck-operator \
    --namespace elastic-system \
    --create-namespace \
    --version v2.4.0 \
    -f operator.yaml
}

function install_stack() {
 kubectl apply -k .
}

install_helm
install_operator
install_stack
