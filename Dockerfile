FROM node:10

RUN mkdir -p /opt/app/src /opt/app/data/mongodb

EXPOSE 3000 3001 9229 9230

WORKDIR /src
COPY . /src

RUN npm install
ENV PATH /opt/app/node_modules/.bin:$PATH

HEALTHCHECK --interval=30s CMD node healthcheck.js

CMD [ "npm", "start" ]
