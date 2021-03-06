FROM alpine:3.14
ENV LANG=C.UTF-8

WORKDIR /opt/opencv/
COPY APKBUILD /opt/opencv/APKBUILD
RUN apk add --update alpine-sdk
RUN abuild-keygen -a -n
RUN abuild -F -r

FROM alpine:3.14
COPY --from=0 /root/packages/opt/*/opencv-4.5.2-r0.apk /root/packages/opt/opencv-4.5.2-r0.apk
RUN apk add /root/packages/opt/opencv-4.5.2-r0.apk --allow-untrusted
