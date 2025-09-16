FROM node:20-alpine AS base
LABEL authors="admin407b"

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

COPY . .

USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]