#!/bin/bash

set -e 

export TKG_MGMT_CLUSTER_YAML_PATH="${TKG_MGMT_CLUSTER_YAML_PATH}"

rm -rf ~/.tanzu/tkg/bom
export TKG_BOM_CUSTOM_IMAGE_TAG="v1.3.1-patch1"
tanzu management-cluster create || ls

tanzu management-cluster create --file TKG_MGMT_CLUSTER_YAML_PATH --yes

tanzu cluster list --include-management-cluster

tanzu management-cluster get
