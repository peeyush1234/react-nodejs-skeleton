FROM node:6.9.5-alpine

# Copy application files
COPY ./build /usr/src/app
WORKDIR /usr/src/app

# Install Yarn and Node.js dependencies
RUN npm install yarn --global --no-progress --silent --depth 0 && \
    yarn install --production --no-progress
RUN npm install -g pm2

EXPOSE 3000

ENV LOG_DIR /var/log

VOLUME /var/log

CMD pm2 start --no-daemon server.js
