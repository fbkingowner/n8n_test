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
  curl \
  git

# Устанавливаем node-html-to-image глобально (по желанию)
RUN npm install -g node-html-to-image

# Устанавливаем кастомную ноду html2image ВНУТРЬ n8n
RUN cd /usr/local/lib/node_modules/n8n && \
  npm install git+https://github.com/siduko/n8n-nodes-html2image.git#main

# Указываем Puppeteer, где искать браузер
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN chown -R node:node /home/node/.n8n
USER node
