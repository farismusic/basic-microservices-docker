FROM bitnami/git AS git
WORKDIR /app
RUN git clone https://github.com/kkenan/basic-microservices.git

FROM node:14-alpine
WORKDIR /app
COPY --from=git /app/basic-microservices/node-app .
RUN npm install
COPY . .
EXPOSE 8081
RUN adduser --disabled-password -u 8877 faris
USER faris
CMD ["node", "index.js"]