# Use the official Node image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the default NestJS port
EXPOSE 3000

# Run the development server with live reloading
CMD ["npm", "run", "start:dev"]