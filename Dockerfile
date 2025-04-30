FROM docker.n8n.io/n8nio/n8n:latest

# Переключаемся на root для установки зависимостей
USER root

# Устанавливаем необходимые пакеты для puppeteer
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
    udev \
    bash

# Устанавливаем глобально puppeteer и node-html-to-image
RUN npm install -g puppeteer@24.7.2 node-html-to-image

# Устанавливаем кастомный нод n8n-nodes-html2image
#RUN cd /usr/local/lib/node_modules/n8n && \
#    npm install git+https://github.com/siduko/n8n-nodes-html2image.git#main

# Указываем puppeteer путь к chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Устанавливаем права обратно пользователю node
RUN chown -R node:node /home/node/.n8n
USER node
