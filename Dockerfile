FROM ubuntu:16.04
MAINTAINER "vccw-team"

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install apt-utils -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y --no-install-recommends ansible curl vim sudo && \
    apt-get clean && \
    groupadd -g 1000 ubuntu && \
    useradd -g ubuntu -G sudo -m -s /bin/bash ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir /opt/provision && chown -R ubuntu:ubuntu /opt/provision
COPY provision /opt/provision

RUN WORK_DIR=$(pwd)

RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

RUN ansible-playbook /opt/provision/playbook.yml

RUN rm -rf /usr/share/doc && \
    rm -rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/man && \
    find /var/cache -type f -exec rm -rf {} \; && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -f ${WORK_DIR}/playbook.yml

COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

CMD ["/usr/bin/monit", "-I", "-c", "/etc/monit/monitrc"]

EXPOSE 20009
EXPOSE 20008
