FROM node:13-alpine

WORKDIR /usr/app

COPY . .
RUN npm install
EXPOSE 3000
CMD ["node","app.js"]