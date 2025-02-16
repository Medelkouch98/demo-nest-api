FROM node:20-alpine as builder

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install development dependencies
RUN npm install

# Copy the rest of the NestJS source code
COPY . .

# Build the NestJS app (generates the /dist folder)
RUN npm run build

# ========================
#  Stage 2: Production
# ========================
FROM node:18

# Set working directory
WORKDIR /app

# Copy the built artifacts from Stage 1
COPY --from=builder /app/dist ./dist
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Expose the NestJS default port
EXPOSE 3000

# Run the app
CMD ["node", "dist/main"]