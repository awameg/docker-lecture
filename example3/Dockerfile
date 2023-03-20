FROM alpine:3.16
ADD secret /opt/secret
RUN export SECRET=$(cat /opt/secret)
RUN rm /opt/secret
