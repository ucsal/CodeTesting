## STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine

COPY --from=build-stage dist/projetofinal-client/out/ /usr/share/nginx/html
COPY --from=build-stage default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

# FROM tiangolo/node-frontend:10 as build-stage
# WORKDIR /app
# COPY package*.json /app/
# RUN npm install
# COPY ./ /app/
# ARG configuration=production
# RUN npm run build -- --output-path=./dist/out --configuration $configuration
# # Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
# FROM nginx:1.15
# COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html
# # Copy the default nginx.conf provided by tiangolo/node-frontend
# COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
