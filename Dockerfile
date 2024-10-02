FROM node:latest as node

ENV HOST=0.0.0.0

WORKDIR /app
COPY . .
#COPY package*.json ./

RUN npm install -g hexo-cli

#COPY . .

RUN if [ ! -f "_config.yml" ]; then hexo init .; fi
RUN npm run build

CMD ["npm", "run", "server"]
