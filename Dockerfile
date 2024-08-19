# Step 1: Specify the base image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the working directory
COPY . .

# Step 6: Build the application
RUN npx nx build pt-notification-service

# Step 7: Expose the application port
EXPOSE 3000

# Step 8: Specify the command to run your application
# Adjust the path according to the output directory
CMD ["node", "dist/apps/pt-notification-service/main.js"]
