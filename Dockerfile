FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# el expose sirve a elastic beastalk para abrirlo, de normal
# en servers locales no funciona asi
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html