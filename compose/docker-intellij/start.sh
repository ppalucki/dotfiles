# pre configuration

############ docker auth
# chmod o+rw /var/run/docker.sock

############ xauth
#https://debian-administration.org/article/494/Getting_X11_forwarding_through_ssh_working_after_running_su
# xauth list
# xauth add `xauth list`

############ inotify
# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
# sudo vim /etc/sysctl.conf
# fs.inotify.max_user_watches = 524288
# sudo sysctl -p --system

PREF_DIR=${HOME}/.IdeaIC_docker
IDEAVIM_RC=${HOME}~/.ideavimrc


docker run -d \
           --name docker-intellji \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${PREF_DIR}:/home/developer/.IdeaIC2016.2 \
           -v ${IDEAVIM_RC}:/home/developer/.ideavimrc \
           -v ${GOPATH}:/home/developer/go \
           -v ~/.Xauthority:/home/developer/.Xauthority \
           --net host \
           dlsniper/docker-intellij
           #--privileged \
