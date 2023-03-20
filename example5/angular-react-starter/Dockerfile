FROM node:14-alpine
WORKDIR /build

COPY ./angular /build
RUN npm install &&\
    npm run build
