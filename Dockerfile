FROM docker.n8n.io/n8nio/n8n:latest

# Работаем от имени root для установки зависимостей
USER root

# Установка системных пакетов
RUN apk add --no-cache ffmpeg curl

# Установка node-html-to-image глобально
RUN npm install -g node-html-to-image

# Назначаем права на домашнюю директорию n8n
RUN chown -R node:node /home/node/.n8n

# Возвращаемся к пользователю node (n8n запускается под ним)
USER node
