# Node.js Frontend Dockerfile Template (React SPA - Development Build)

# Use a stable Node.js image
# Alpine reduces image size but may have compatibility issues with some React/node-sass versions
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker layer caching
# Supports both package.json and package-lock.json
COPY package*.json ./

# Install all dependencies (including devDependencies)
# This is acceptable for development containers where hot reloading and dev tools are needed
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the React app listens on (default is 3000)
EXPOSE 3000

# Start the development server using npm start script
CMD ["npm", "start"]
