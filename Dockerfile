# Use a Node.js for base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copies all the application files
COPY . .

# Exposes port 3000
EXPOSE 3000

# Starts the application
CMD ["npm", "start"]