FROM docker.n8n.io/n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg curl chromium
RUN npm install -g puppeteer@19.0.0 --omit-optional --unsafe-perm
RUN cd /usr/local/lib/node_modules/n8n && rm -rf node_modules && npm install git+ssh://git@github.com:siduko/n8n-nodes-html2image.git#main
RUN chown -R node:node /home/node/.n8n
USER node
