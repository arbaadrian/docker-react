FROM node:alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build



FROM nginx

# this does not do much regularly, but is usefull for Elastic Beanstalk
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html