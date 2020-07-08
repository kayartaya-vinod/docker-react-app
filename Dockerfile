FROM node:alpine as buildphase

WORKDIR /usr/vinod/app

COPY ./package.json ./

RUN npm i

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=0 /usr/vinod/app/build /usr/share/nginx/html/

EXPOSE 80

