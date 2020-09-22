# Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# app/build <-- contains built files

# Run Phase
FROM nginx
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
