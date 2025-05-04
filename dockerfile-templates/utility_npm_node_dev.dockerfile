# Node.js Utility Container Dockerfile Template (npm - Development Use)

# Use a stable, small Node.js image
FROM node:14-alpine

# By default, this container runs as root.
# If desired, uncomment USER node to run as the non-root 'node' user (UID/GID 1000:1000).
# On Linux, to match host UID/GID and avoid permission issues with mounted volumes,
# consider building the image with custom ARGs for USER_ID and GROUP_ID.
# UID/GID 1000:1000 usually maps to your first Linux user (e.g., "ilona" in my case).
#
# 🔧 Quick fix during development:
# If permission errors occur when writing to mounted volumes,
# add write permissions to the project directory:
# chmod -R a+w /path/to/your/project
#
# ⚠ Note: Matching the container user to your local Linux user (UID/GID)
# makes the image less portable across different environments.
# For local Utility Containers, this trade-off is usually acceptable.

# USER node

# Set working directory
WORKDIR /app

# Use npm as the container's entrypoint so any npm command can be run directly
ENTRYPOINT [ "npm" ]

#####################################################################
# 📚 Usage examples:
#
# 1️⃣ Build the image (from the folder containing this Dockerfile):
# docker build -t mynpm .
#
# 2️⃣ Run npm commands inside the container (with bind mount):
# docker run -it -v /path/to/your/project:/app mynpm init
#
# Example to install a package:
# docker run -it -v /path/to/your/project:/app mynpm install express
#
# 3️⃣ Using docker-compose:
# version: "3.8"
# services:
#   npm:
#     build: ./
#     stdin_open: true
#     tty: true
#     volumes:
#       - ./your-project:/app
#
# docker-compose run --rm npm init
#
#####################################################################