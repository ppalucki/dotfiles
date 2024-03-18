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

#### netstat without netstat

copied from: https://staaldraad.github.io/2017/12/20/netstat-without-netstat/

```
awk 'function hextodec(str,ret,n,i,k,c){
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2)); 
    for (i=5; i>0; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
} 
NR > 1 {{if(NR==2)print "Local - Remote";local=getIP($2);remote=getIP($3)}{print local" - "remote}}' /proc/net/tcp 
```

### Syntax high
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
vim ~/.zshrc
plugins=(zsh-syntax-highlighting)

