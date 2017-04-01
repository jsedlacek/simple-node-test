FROM node:7-alpine

RUN apk add --update-cache curl tar

RUN mkdir /downloads

RUN curl -L https://yarnpkg.com/latest.tar.gz > /downloads/yarn.tar.gz
RUN mkdir /yarn
RUN tar xf /downloads/yarn.tar.gz -C /yarn --strip 1
ENV PATH "/yarn/bin:$PATH"

COPY package.json /
COPY yarn.lock /

RUN yarn

COPY index.js /

CMD ["node", "index.js"]

EXPOSE 8000
