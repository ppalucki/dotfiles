#https://krew.sigs.k8s.io/docs/user-guide/setup/install/#bash
#(
#  set -x; cd "$(mktemp -d)" &&
#  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
#  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
#  KREW="krew-${OS}_${ARCH}" &&
#  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
#  tar zxvf "${KREW}.tar.gz" &&
#  ./"${KREW}" install krew
#)
k krew install cert-manager
k krew install cost
k krew install ctx
k krew install cyclonus
k krew install direct-csi
k krew install edit-status
k krew install example
k krew install fleet
k krew install get-all
k krew install graph
k krew install grep
k krew install konfig
k krew install krew
k krew install pod-dive
k krew install pod-inspect
k krew install popeye
k krew install rbac-lookup
k krew install rbac-tool
k krew install rbac-view
k krew install resource-capacity
k krew install service-tree
k krew install sniff
k krew install tail
k krew install trace
k krew install tree
k krew install view-allocations
k krew install view-secret
k krew install view-serviceaccount-kubeconfig
k krew install view-utilization
k krew install view-webhook
k krew install viewnode
k krew install virt

