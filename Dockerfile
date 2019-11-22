FROM node:alpine as builder
WORKDIR '/app' 
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# from the nginx documentation on docker hub
COPY --from=builder /app/build /usr/share/nginx/html
# 80 --> is the default port that nginx uses 