#### dotfiles

Just bunch of my configurations files...

#### tips

usually are in form of zshrc or git aliases but there are some others

##### sshd port forwarding:
    
vim /etc/ssh/sshd_config 

```
AllowTcpForwarding yes
UsePrivilegeSeparation yes
```

and remember to run ssh client as root/admin


##### Security issues :)

```
sudo setenforce 0
sudo systemctl disable firewalld
```


##### get vim

```
# wget version
wget --no-check-certificate https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_VI -O /bin/vi; chmod +x /bin/vi

# curl version
curl -k https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_VI -o /bin/vi; chmod +x /bin/vi
```

##### micro .vimrc config 

1. <c-x> executes current line in pane target 1

```
map <c-x> :python import vim,subprocess;subprocess.call(['tmux', 'send-keys', '-t', '1', vim.current.line, 'enter'])<cr>
```

##### micro .tmux.conf

1. vi mode-keys
2. ctrl-a prefix    
 
```
# visual vi mode
setw -g mode-keys vi
# prefix & last window
unbind C-b
set-option -g prefix C-a
bind a send-prefix
unbind ^A
bind ^A last-window
# split window
bind s split-window -v
bind v split-window -h
# select pane
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind C-h select-pane -L
bind C-j select-pane -D
bind C-k select-pane -U
bind C-l select-pane -R
```
