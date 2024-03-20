#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd "$DIR" > /dev/null
yq '.k9s.clusters[].featureGates.nodeShell=true' config.yml -i -y
yq '.k9s.clusters[].featureGates.image="eu.gcr.io/gardener-project/gardener/ops-toolbelt"' config.yml -i -y
#yq '.k9s.clusters[].shellPod.command = ["/usr/sbin/chroot"]' config.yml -i -y
yq '.k9s.clusters[].shellPod.command = []' config.yml -i -y
#yq '.k9s.clusters[].shellPod.args = ["/host"]' config.yml -i -y
yq '.k9s.clusters[].shellPod.args = []' config.yml -i -y
popd
