FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install -g hexo-cli

COPY . .

RUN if [ ! -f "_config.yml" ]; then hexo init .; fi
RUN npm run build

ENV HOST=0.0.0.0

CMD ["npm", "run", "server"]
