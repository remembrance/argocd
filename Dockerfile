ARG ARGOCD_VERSION=2.4.13
FROM argoproj/argocd:v$ARGOCD_VERSION

USER root

RUN apt-get update \
 && apt-get install -y git-crypt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git /usr/bin/git

# $ id
# uid=999(argocd) gid=999(argocd) groups=999(argocd)
USER 999
