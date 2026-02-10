FROM node:slim

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

RUN mkdir waf-checker

WORKDIR waf-cheker/

RUN mkdir app

COPY app/ app/
COPY package-lock.json .
COPY package.json .
COPY wrangler.toml .

RUN npm install

EXPOSE 8787

CMD npx wrangler dev --ip 0.0.0.0


