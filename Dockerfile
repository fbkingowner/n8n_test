FROM node:20-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    wget \
    curl \
    ffmpeg \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем n8n и нужные пакеты
RUN npm install -g n8n puppeteer@24.7.2

# Указываем путь до Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Открываем порт
EXPOSE 5678

# Запуск n8n
CMD ["n8n"]
