# Node.js REST API backend with MongoDB

# Use a stable, small Node.js image
# Alpine reduces image size and attack surface
FROM node:14-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker layer caching
# Supports both package.json and package-lock.json
COPY package*.json ./

# Install production dependencies only (excludes devDependencies)
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Set environment variables for MongoDB connection
# These should be overridden at runtime in production or development environments
ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret

# Expose the port the app listens on
# This does not publish the port but documents it for whoever runs the container
EXPOSE 80

# Start the application using npm start script
CMD ["npm", "start"]
