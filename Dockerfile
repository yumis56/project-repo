FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install -g hexo-cli

COPY . .

RUN if [ ! -f "_config.yml" ]; then hexo init .; fi
RUN npm run build

CMD ["npm", "run", "server"]
