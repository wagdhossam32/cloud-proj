# Use the latest LTS (Long Term Support) version of node instead of just the latest version
FROM node:latest

# Set the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow in the Dockerfile
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ./public-html/package*.json ./

# Install dependencies
RUN npm install 

# Copy the server code into the container
COPY ./public-html/backendserver.js .

# Inform Docker that the container listens on the specified network port at runtime.
EXPOSE 3000

# Command to run the application
CMD [ "node", "backendserver.js" ]
