#!/usr/bin/env bash

source hack/common.sh

# Specify the URL link to the machine config pool CRD
CRD_MACHINE_CONFIG_POOL_URL="https://raw.githubusercontent.com/openshift/machine-config-operator/master/install/0000_80_machine-config-operator_01_machineconfigpool.crd.yaml"
# Specify the URL link to the kubeletconfig CRD
CRD_KUBELET_CONFIG_URL="https://raw.githubusercontent.com/openshift/machine-config-operator/master/install/0000_80_machine-config-operator_01_kubeletconfig.crd.yaml"

[ ! -x ${REPO_DIR}/bin/lsplatform ] && exit 1

if ${REPO_DIR}/bin/lsplatform -is-platform openshift; then
	echo "detected openshift platform - nothing to do"
	exit 0
fi

echo kubectl apply -f ${CRD_MACHINE_CONFIG_POOL_URL}
kubectl apply -f ${CRD_MACHINE_CONFIG_POOL_URL}
echo kubectl apply -f ${CRD_KUBELET_CONFIG_URL}
kubectl apply -f ${CRD_KUBELET_CONFIG_URL}
