FROM node:alpine as react-build 

WORKDIR '/dockerapp'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=react-build /dockerapp/build /usr/share/nginx/html
