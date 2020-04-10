FROM node:alpine as react-build 

WORKDIR '/dockerapp'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=react-build /dockerapp/build /usr/share/nginx/html
