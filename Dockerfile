FROM ubuntu:14.04
MAINTAINER Jin Zhou <ferryzhou@gmail.com>
LABEL description="godev"

ENV VOLUME_OWNER gouser

RUN apt-get update
RUN apt-get install -y build-essential mercurial git subversion wget curl \
      && apt-get autoremove \
      && apt-get clean
RUN groupadd -r ${VOLUME_OWNER} \
      && useradd -r -m -g ${VOLUME_OWNER} ${VOLUME_OWNER}

USER ${VOLUME_OWNER} 

RUN curl -o ~/gvm-installer -SL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer \
	&& chmod a+x ~/gvm-installer \
	&& ~/gvm-installer \
	&& bash -c "source ~/.gvm/scripts/gvm" \
	&& gvm install go1.4 \
	&& gvm use go1.4 \
	&& export GOROOT_BOOTSTRAP=$GOROOT \
	&& gvm install go1.5 \
	&& gvm use go1.5


