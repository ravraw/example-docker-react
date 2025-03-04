# 1. Build Production bundle

FROM node:22-alpine AS build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --production

COPY . .

RUN yarn build

# 2 Serve the bundle with an HTTP server
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY --from=build  /app/build /usr/share/nginx/html



