# Nginx Web Server Dockerfile Template (PHP Laravel App - Production Snapshot)

# Use official Nginx image
FROM nginx:stable-alpine

# Stage 1: 
# Configuration

# Set working directory for nginx config
WORKDIR /etc/nginx/conf.d/

# Copy custom nginx configuration file into the container
COPY nginx/nginx.conf .

# Rename the config file to replace the default
RUN mv nginx.conf default.conf

# Stage 2: 
# Application code

# Set working directory for Laravel application code
WORKDIR /var/www/html

# Copy application source code into the container
COPY src .

#####################################################################
# 📚 Usage examples:
#
# 1️⃣ Build the custom nginx image:
# docker build -t mynginx .
#
# 2️⃣ Run the container manually:
# docker run -p 8000:80 mynginx
#
# 3️⃣ Using docker-compose:
# version: "3.8"
# services:
#   server:
#     build:
#       context: .
#       dockerfile: dockerfiles/webserver_nginx_php_prod.dockerfile
#     ports:
#       - '8000:80'
#     # Development only - volumes to override config and app code (disable for prod):
#     # volumes:
#     #   - ./src:/var/www/html
#     #   - ./nginx/nginx.conf:/etc/nginx/conf.d/default.conf:ro
#     depends_on:
#       - php
#       - mysql
#####################################################################
