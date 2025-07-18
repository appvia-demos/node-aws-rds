# syntax=docker/dockerfile:1
FROM node:22-alpine
LABEL maintainer="Appvia Ltd <info@appvia.io>"
WORKDIR /app

# Install Python, distutils, and build dependencies for node-gyp
RUN apk add --no-cache python3 python3-dev py3-setuptools make g++

COPY ./app/yarn.lock ./
COPY ./app/package.json ./
RUN yarn install --production
COPY ./app .
EXPOSE 3000
CMD ["node", "src/index.js"]