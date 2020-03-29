#Multi stage docker file

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build     
#CMD ["npm", "run", "start"]

FROM nginx
# In production only
EXPOSE 80
# COPY static-html-directory /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/hrml 