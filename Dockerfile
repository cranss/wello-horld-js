# Use the official Node.js 10 image.
# https://hub.docker.com/_/node
FROM node:18.13.0

RUN apt-get update && apt-get install -y libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2

# Create app directory.
WORKDIR /usr/src/app

# Install app dependencies.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying just package.json would work if package-lock.json wasn't available.
COPY package*.json ./

RUN npm install

# Bundle app source code.
COPY . .

# Expose the port on which the app will run.
EXPOSE 28000

# Define the default command to run when the container starts.
CMD ["npm", "start"]