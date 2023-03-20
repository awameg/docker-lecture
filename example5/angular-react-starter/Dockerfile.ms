FROM node:14-alpine AS builder
WORKDIR /build

COPY ./angular /build
RUN npm install &&\
    npm run build

FROM nginx:1.22.0-alpine AS runtime
WORKDIR /app

RUN rm /etc/nginx/conf.d/default.conf &&\
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx /var/run/nginx.pid /app
COPY --from=builder /build/dist/angular-starter/ /app
COPY nginx.conf /etc/nginx/conf.d/default.conf

USER nginx
