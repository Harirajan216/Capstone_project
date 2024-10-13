# Use an official Node.js runtime as a parent image
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Install serve globally to serve static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 80

# Command to run the app
CMD ["serve", "-s", "build", "-l", "80"]
