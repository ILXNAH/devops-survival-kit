# Node.js Backend Dockerfile Template (REST API with MongoDB - Multi-Stage Production Build)

# ---- Stage 1: Build the application ----
FROM node:14-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Install all dependencies (prod + dev) for build
RUN npm install

# Copy the rest of the application code
COPY . .

# If using TypeScript, build it here (skip if pure JavaScript)
# RUN npm run build

# ---- Stage 2: Create the production image ----
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package files again (to install only production dependencies)
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy only necessary app files or build output from the previous stage
COPY --from=build /app ./

# Environment variables for production runtime
ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret

# Document the port
EXPOSE 80

# Start the application
CMD ["npm", "start"]