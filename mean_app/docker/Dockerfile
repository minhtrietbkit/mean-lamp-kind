FROM node:10.18.0-alpine3.11

COPY backend /backend
COPY dist /dist

WORKDIR /backend
RUN ["/usr/local/bin/npm", "install", "--production"]
ENTRYPOINT [ "/usr/local/bin/node", "server.js" ]
