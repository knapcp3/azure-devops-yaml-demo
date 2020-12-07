FROM node:13.12.0-alpine as build
WORKDIR /app
COPY app/package.json ./
COPY app/package-lock.json ./
RUN npm ci --silent
COPY app ./
RUN npm run build

FROM nginx:stable-alpine as serve
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3333
CMD ["nginx", "-g", "daemon off;"]