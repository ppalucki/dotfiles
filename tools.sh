################## BINARIES

#### ----------------------------------------------------------
#### Kubernetes/Containers
#### ----------------------------------------------------------

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" ; chmod +x kubectl; mv kubectl /usr/local/bin/kubectl
kubectl version

# krew
curl -sL -o - https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz | gzip -d - | tar xvf - -C /usr/local/bin ; /usr/local/bin/krew-linux_amd64 install krew
kubectl krew version
kubectl krew install access-matrix rbac-lookup rbac-tool rbac-view who-can resource-capacity view-allocations view-utilization get-all example

# k9s
curl -sL -o - https://github.com/derailed/k9s/releases/download/v0.32.7/k9s_Linux_amd64.tar.gz | tar -C /usr/local/bin -xzvf - k9s
\k9s version

# reg
curl -fSL "https://github.com/genuinetools/reg/releases/download/v0.16.1/reg-linux-amd64" -o "/usr/local/bin/reg" && chmod a+x "/usr/local/bin/reg"
reg version

# helm
curl -sL -o - /usr/local/bin/helm3161 https://get.helm.sh/helm-v3.16.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzvf - --strip-components=1 linux-amd64/helm
helm version

# nerdctl
VERSION=2.0.2 ; wget https://github.com/containerd/nerdctl/releases/download/v$VERSION/nerdctl-$VERSION-linux-amd64.tar.gz && tar -C /usr/local/bin -xzvf nerdctl-$VERSION-linux-amd64.tar.gz

# crictl
VERSION=1.32.0 ; wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v$VERSION/crictl-v$VERSION-linux-amd64.tar.gz && tar -C /usr/local/bin -xzvf crictl-v$VERSION-linux-amd64.tar.gz; crictl -v

# istioctl
#curl -fSL "https://github.com/istio/istio/releases/download/1.22.6/istioctl-1.22.6-linux-amd64.tar.gz" | tar -C /usr/local/bin -xzvf - istioctl ; chmod +x /usr/local/bin/istioctl
curl -fSL "https://github.com/istio/istio/releases/download/1.23.2/istioctl-1.23.2-linux-amd64.tar.gz" | tar -C /usr/local/bin -xzvf - istioctl ; chmod +x /usr/local/bin/istioctl
istioctl version

# kind multiple versions
curl -sL -o /usr/local/bin/kind22 https://github.com/kubernetes-sigs/kind/releases/download/v0.22.0/kind-linux-amd64 # v1.29.0
curl -sL -o /usr/local/bin/kind23 https://github.com/kubernetes-sigs/kind/releases/download/v0.23.0/kind-linux-amd64 # v1.30.0
curl -sL -o /usr/local/bin/kind24 https://github.com/kubernetes-sigs/kind/releases/download/v0.24.0/kind-linux-amd64 # v1.31.0
curl -sL -o /usr/local/bin/kind25 https://github.com/kubernetes-sigs/kind/releases/download/v0.25.0/kind-linux-amd64 # v1.31.2
ls -l /usr/local/bin/kind*
chmod +x /usr/local/bin/kind*
hash -r
ln -svf /usr/local/bin/kind22 /usr/local/bin/kind
ln -svf /usr/local/bin/kind23 /usr/local/bin/kind
ln -svf /usr/local/bin/kind24 /usr/local/bin/kind
ln -svf /usr/local/bin/kind25 /usr/local/bin/kind
kind version

# kustomize
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.5.0/kustomize_v5.5.0_linux_amd64.tar.gz -o - | tar -C /usr/local/bin -xzvf - kustomize
kustomize version

#### ----------------------------------------------------------
#### Development
#### ----------------------------------------------------------

# golang
cd /tmp ; wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz ; rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz
echo $PATH
go version


# telepresence
sudo curl -fL https://app.getambassador.io/download/tel2oss/releases/download/v2.20.0/telepresence-linux-amd64 -o /usr/local/bin/telepresence ;sudo chmod a+x /usr/local/bin/telepresence
telepresence version

# sesh https://github.com/joshmedeski/sesh/releases/download/v2.7.0/sesh_Linux_x86_64.tar.gz
curl -fL https://github.com/joshmedeski/sesh/releases/download/v2.7.0/sesh_Linux_x86_64.tar.gz -o - | tar -C /usr/local/bin/ -xzvf - sesh
sesh -v
mkdir -p ~/.config/sesh && touch ~/.config/sesh/sesh.toml

# smug
curl -fL https://github.com/ivaaaan/smug/releases/download/v0.3.5/smug.0.3.5._Linux_x86_64.tar.gz -o - | tar -C /usr/local/bin/ -xzvf - smug
mkdir -p /root/.config/smug
smug  | head -1

# fortio
curl -fL https://github.com/fortio/fortio/releases/download/v1.68.0/fortio-linux_amd64-1.68.0.tgz -o - | tar -C /usr/local/bin/ --strip-components=2 -xzvf - usr/bin/fortio
fortio version

#### ----------------------------------------------------------
#### Telemetry
#### ----------------------------------------------------------

# Loki logcli
curl -sL -o - https://github.com/grafana/loki/releases/download/v3.2.0/logcli-linux-amd64.zip | zcat >logcli ; chmod +x logcli ; sudo mv logcli /usr/local/bin/
logcli --version

# otel-cli
curl -sL -o - https://github.com/equinix-labs/otel-cli/releases/download/v0.4.5/otel-cli_0.4.5_linux_386.tar.gz  | tar -C /usr/local/bin -xzvf - otel-cli

# prometheus / tool
curl -fSL "https://github.com/prometheus/prometheus/releases/download/v2.55.1/prometheus-2.55.1.linux-amd64.tar.gz" | tar -C /usr/local/bin -xzvf - --strip-components=1 prometheus-2.55.1.linux-amd64/promtool ; chmod +x /usr/local/bin/promtool
promtool --help

###############################################################
################## UBUNTU
###############################################################
# docker from package manager
apt update
apt install -y zsh git tmux vim silversearcher-ag htop make
apt install -y docker.io docker-buildx docker-compose-v2
apt install -y universal-ctags
