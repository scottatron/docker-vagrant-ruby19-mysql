FROM scottatron/baseimage-ruby19-mysql

ADD . /build/
RUN useradd -m -s /bin/bash vagrant &&\
    passwd -d vagrant &&\
    echo "vagrant ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
    rsync -r /build/home / &&\
    chown -R vagrant: /home/vagrant &&\
    rm -rf /build
