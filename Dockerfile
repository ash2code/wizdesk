# Base image
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining application files
COPY . .

# Build the application (replace with your actual build command if different)
RUN npm run build

# Switch to a slimmer runtime image
FROM node:20-alpine AS runner

# Set working directory
WORKDIR /app

# Copy only the production-ready files (replace with your actual build output path)
COPY --from=builder /app/build .

# Expose port (replace with your application port if different)
EXPOSE 3000

# Start the application (replace with your actual start command if different)
CMD [ "npm", "start" ]
