FROM node:10.12.0-alpine

# add bash
RUN apk update
RUN apk upgrade
RUN apk add bash

WORKDIR /usr/src/app
# https://stackoverflow.com/a/32785014/232619
COPY . /usr/src/app
RUN npm install
COPY wait-for-it.sh /usr/local
RUN chmod +x /usr/local/wait-for-it.sh

EXPOSE 3000

CMD ["npm", "start"]
