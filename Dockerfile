FROM alpine
ARG TARGETARCH
ARG KUBERNETES_RELEASE=v1.21.3
WORKDIR /bin
RUN set -x \
  && apk --no-cache add curl gettext \
  && curl -fsSLO https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_RELEASE}/bin/linux/${TARGETARCH}/kubectl \
  && chmod +x kubectl 
WORKDIR /workspace
