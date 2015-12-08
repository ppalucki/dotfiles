gogz=go1.5.1.linux-amd64.tar.gz

if [ ! -d /usr/local/go ]; then
  if [ ! -f ~/$gogz ]; then
    wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz -o ~/$gogz
  else
    echo ~/$gogz already downloaded!
  fi
  tar -C /usr/local -xvzf ~/$gogz
else
  echo /usr/local/go exists!
fi

mkdir -p work/go
