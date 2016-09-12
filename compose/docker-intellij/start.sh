# pre configuration

############ xauth
#https://debian-administration.org/article/494/Getting_X11_forwarding_through_ssh_working_after_running_su
# xauth list
# xauth add `xauth list`

############ inotify
# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
# sudo vim /etc/sysctl.conf
# fs.inotify.max_user_watches = 524288
# sudo sysctl -p --system




PREF_DIR=${HOME}/.IdeaIC15_docker

sudo -E docker run -ti \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${PREF_DIR}:/home/developer/.IdeaIC15 \
           -v ${GOPATH}:/home/developer/go \
           -v ~/.Xauthority:/home/developer/.Xauthority \
           --net host \
           dlsniper/docker-intellij

           #--privileged \
