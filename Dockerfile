# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# app/build <-- contains built files

# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
