FROM node:26-alpine3.23

WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Run npm install to fetch dependencies
RUN npm install

# Copy the rest of the project source code
COPY . .

# Run an npm build script
RUN npm run build

EXPOSE 4321
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
