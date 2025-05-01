FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Устанавливаем необходимые библиотеки для Chromium
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    udev \
    bash \
    nodejs \
    npm \
    dumb-init \
    && rm -rf /var/cache/apk/*

# Устанавливаем puppeteer с нужной версией Chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
RUN npm install -g puppeteer@24.7.2 node-html-to-image

# Указываем путь к Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Назначаем права пользователю node
RUN chown -R node:node /home/node/.n8n

USER node
