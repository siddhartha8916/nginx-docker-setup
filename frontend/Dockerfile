# Stage 1: Build the app
FROM node:lts-alpine AS base

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve the built app with Nginx
FROM nginx:alpine

# Expose port 80 (Nginx default HTTP port)
EXPOSE 80

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files from the build stage
COPY --from=base /app/dist /usr/share/nginx/html
