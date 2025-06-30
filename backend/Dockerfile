# ========== Base: Install all deps and build ==========
FROM node:lts-alpine AS base

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# ========== Final: Minimal distroless image ==========
FROM gcr.io/distroless/nodejs:18

WORKDIR /app

# Copy compiled code
COPY --from=base /app/index.js ./dist/

# Copy base-only node_modules
COPY --from=base /app/node_modules ./node_modules

