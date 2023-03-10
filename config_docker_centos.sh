# remove conflict packages with Docker first
dnf -y remove podman runc

curl https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/docker-ce.repo
dnf --enablerepo=docker-ce-stable -y install docker-ce

systemctl enable --now docker

rpm -q docker-ce

rpm -q docker-ce

docker run hello-world

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version
