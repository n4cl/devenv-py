FROM ubuntu:16.04

# ssh
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# python
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y git python-dev python-pip libssl-dev libffi-dev zlib1g-dev libbz2-dev libreadline-dev
RUN git clone https://github.com/yyuu/pyenv.git .pyenv
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

WORKDIR .pyenv
RUN git pull
RUN pyenv install 3.7.1
RUN pyenv global 3.7.1

# copy application
RUN mkdir /home/app
ADD app /home/app
WORKDIR /home/app

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]