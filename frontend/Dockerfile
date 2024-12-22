FROM node:22.12-slim

ENV TZ Asia/Tokyo

WORKDIR /app

COPY package*.json .
RUN npm ci

COPY . /app

CMD ["npm", "run", "dev" "--" "-p" "4000"]