FROM node

LABEL maintainer="Maxime Pierre <maxime.pierre@webmediasolutionz.com>"

RUN apt-get update && apt-get install -y nginx && npm i -g @angular/cli@6

RUN rm /etc/nginx/sites-enabled/*

WORKDIR /etc/nginx/sites-enabled/

COPY nginx.conf nginx.conf

WORKDIR /app/

COPY package.json package.json

RUN npm i

COPY . .

RUN ng build --prod

RUN nginx -t && service nginx reload

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
