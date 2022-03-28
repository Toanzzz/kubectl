FROM alpine as base
ARG TARGETARCH
ARG KUBERNETES_RELEASE=v1.21.3
WORKDIR /bin
RUN set -x \
  && apk --no-cache add curl gettext \
  && curl -fsSLO https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_RELEASE}/bin/linux/${TARGETARCH}/kubectl \
  && chmod +x kubectl

FROM alpine as final
COPY --from=alpine /bin/kubectl /bin/sh /usr/bin/envsubst /bin/
ENTRYPOINT ["/bin/sh"]
