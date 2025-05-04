# Node.js Basic Dockerfile Template

# Use a small, secure Node.js image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy only the package files first (leverages Docker cache)
COPY package*.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Set build-time default port (can be overridden at runtime)
ARG DEFAULT_PORT=80
ENV PORT=$DEFAULT_PORT

# Expose the port the app listens on
EXPOSE $PORT

# Optional: Use a volume for node_modules to avoid overwriting during local dev
# This prevents host bind mounts (e.g., -v $(pwd):/app) from overwriting the container's node_modules.
# Declaring the volume ensures that node_modules inside the container stays isolated.
# By default, this will create an anonymous Docker-managed volume unless a named volume is specified at runtime.
# Example for named volume (docker run):
#   docker run -v my_node_modules:/app/node_modules ...
# Example for named volume (docker-compose):
#   volumes:
#     - my_node_modules:/app/node_modules
#   volumes:
#     my_node_modules:
# If you don't mount anything at runtime, Docker will create an anonymous volume automatically.
# VOLUME [ "/app/node_modules" ]

# Start the app
CMD ["npm", "start"]