# Node.js Backend Dockerfile Template (TypeScript REST API - Multi-Stage Production Build)

# ---- Stage 1: Build the application ----
FROM node:20 AS build

# Set working directory inside the container
WORKDIR /app

# Copy all files from the local directory into the container
COPY . .

# Install dependencies and build the app
# npm ci → clean install using package-lock.json
# npm run build → usually compiles TypeScript to JavaScript into /dist folder
RUN npm ci && npm run build


# ---- Stage 2: Create the production image ----
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy the build output (compiled code) from the previous stage
# Only /dist folder is needed for production
COPY --from=build /app/dist ./

# Install only production dependencies
RUN npm ci --production

# Start the app
# Runs: node index.js
CMD ["node", "index.js"]