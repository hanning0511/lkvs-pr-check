FROM ubuntu:20.04

LABEL Maintainer="Han Ning <ning.han@intel.com>"
LABEL Name="LKVS Pull Request Check"

RUN apt update && \
    apt install -y --no-install-recommends \
          python3 \
          python3-pip \
          python3-git \
          python3-ply \
          git \
          shellcheck \
          perl \
	  codespell && \
    apt autoremove

ADD shellcheckrc /root/.shellcheckrc
ADD spelling.txt /usr/bin/spelling.txt
ADD const_structs.checkpatch /usr/bin/const_structs.checkpatch
ADD checkpatch.pl /bin/checkpatch.pl
RUN chmod +x /bin/checkpatch.pl
USER root
