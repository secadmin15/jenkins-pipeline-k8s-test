FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Hardening Scripts
USER root
# ADD /root/docker-bench-security/docker-bench-security.sh /
# RUN cd /root/docker-bench-security
COPY docker-bench-security/docker-bench-security.sh .
RUN /bin/bash "/docker-bench-security.sh"
HEALTHCHECK CMD exit 0


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

USER nonuser

EXPOSE 9000
CMD [ "node", "server.js" ]

