FROM alpine:3.16
RUN apk update &&\
    apk --no-cache add nginx &&\
    rm /etc/nginx/http.d/default.conf
COPY site.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx","-g","daemon off;"]
