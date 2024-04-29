FROM node:14

RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/kkenan/basic-microservices.git

RUN npm install /app/basic-microservices/node-app

COPY . .

EXPOSE 8081

# Avoid running app as root user
RUN useradd -u 8877 faris --home
USER faris

CMD ["node", "/app/basic-microservices/node-app/index.js"]