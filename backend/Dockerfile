FROM node:14-alpine
COPY package.json ./
RUN npm install && mkdir /app && chmod -R 755 /app && mv ./node_modules ./app
WORKDIR /app
COPY . .
EXPOSE 7000
CMD ["npm","run","serve"]