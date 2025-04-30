FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Устанавливаем зависимости для Puppeteer
RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  nodejs \
  npm \
  ffmpeg \
  curl

# Устанавливаем node-html-to-image
RUN npm install -g node-html-to-image
RUN npm install --save html-to-image

# Указываем Puppeteer, где искать браузер
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN chown -R node:node /home/node/.n8n
USER node
