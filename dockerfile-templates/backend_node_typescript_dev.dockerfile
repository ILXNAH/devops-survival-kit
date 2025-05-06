# ---- Development Image ----
    FROM node:20

    # Set working directory inside the container
    WORKDIR /app
    
    # Copy package files first (better caching)
    COPY package*.json ./
    
    # Install all dependencies (dev + prod)
    RUN npm ci
    
    # Copy the rest of the application code
    COPY . .
    
    # Optional: expose a development port (adjust to your app, e.g., 3000)
    EXPOSE 3000
    
    # Set environment variable to indicate development
    ENV NODE_ENV=development
    
    # Start the app (adjust as needed — might be "npm start" or "node index.js")
    CMD ["npm", "run", "dev"]
    